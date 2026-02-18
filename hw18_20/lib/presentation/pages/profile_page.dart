import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/error/error_localizer.dart';
import '../../l10n/app_localizations.dart';

import '../../core/avatar_service.dart';
import '../widgets/profile_info_widget.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _localAvatarPath;

  @override
  void initState() {
    super.initState();
    _loadExistingAvatar();
  }

  Future<void> _loadExistingAvatar() async {
    final authBloc = context.read<AuthBloc>();
    final currentState = authBloc.state;

    if (currentState is Authenticated) {
      final avatarService = context.read<AvatarService>();
      final existingAvatar = await avatarService.loadAvatarFromCache(
        currentState.user.uid,
      );
      if (existingAvatar != null) {
        setState(() {
          _localAvatarPath = existingAvatar.path;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        debugPrint(
          '👂 ProfilePage: BlocListener received state: ${state.runtimeType}',
        );
        if (state is PasswordChangedSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)!.passwordChanged),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is AuthFailureState) {
          final localizedMessage = ErrorLocalizer.localize(
            context,
            state.failure,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(localizedMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          debugPrint(
            '🔄 ProfilePage: Building with auth state: ${state.runtimeType}',
          );
          if (state is Authenticated) {
            debugPrint(
              '🔄 ProfilePage: User authenticated, avatarUrl: ${state.avatarUrl}',
            );
            return Scaffold(
              appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.profile),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => context.go('/home'),
                ),
                actions: [
                  TextButton.icon(
                    onPressed: () => context.go('/home'),
                    icon: const Icon(Icons.task, color: Colors.white),
                    label: Text(
                      AppLocalizations.of(context)!.myTasks,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          key: ValueKey(
                            '${_localAvatarPath}_${DateTime.now().millisecondsSinceEpoch}',
                          ), // Unique key to force rebuild
                          radius: 50,
                          backgroundImage: _localAvatarPath != null
                              ? FileImage(
                                  File(_localAvatarPath!),
                                ) // Local file image
                              : null,
                          child: _localAvatarPath == null
                              ? const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () =>
                                  _showAvatarOptions(context, state.user.uid),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ProfileInfoWidget(
                      label: AppLocalizations.of(context)!.name,
                      value:
                          state.user.displayName ??
                          AppLocalizations.of(context)!.notSpecified,
                    ),
                    const SizedBox(height: 16),
                    ProfileInfoWidget(
                      label: AppLocalizations.of(context)!.email,
                      value:
                          state.user.email ??
                          AppLocalizations.of(context)!.notSpecified,
                    ),
                    const SizedBox(height: 16),
                    ProfileInfoWidget(
                      label: AppLocalizations.of(context)!.userId,
                      value: state.user.uid,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton.icon(
                      onPressed: () => context.go('/home'),
                      icon: const Icon(Icons.task),
                      label: Text(AppLocalizations.of(context)!.myTasks),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalizations.of(context)!.actions,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => _showChangePasswordDialog(context),
                      icon: const Icon(Icons.lock),
                      label: Text(AppLocalizations.of(context)!.changePassword),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                      ),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: () {
                        _showLogoutDialog(context);
                      },
                      icon: const Icon(Icons.logout, color: Colors.red),
                      label: Text(
                        AppLocalizations.of(context)!.logoutFromAccount,
                        style: const TextStyle(color: Colors.red),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        side: const BorderSide(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: Text(AppLocalizations.of(context)!.loginRequired),
            ),
          );
        },
      ),
    );
  }

  void _showAvatarOptions(BuildContext context, String userId) {
    showModalBottomSheet<void>(
      context: context,
      builder: (modalContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(AppLocalizations.of(context)!.selectFromGallery),
                onTap: () {
                  Navigator.of(modalContext).pop();
                  _pickImageFromGallery(context, userId);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(AppLocalizations.of(context)!.takePhoto),
                onTap: () {
                  Navigator.of(modalContext).pop();
                  _takePhotoWithCamera(context, userId);
                },
              ),
              if (_localAvatarPath != null) ...[
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: Text(
                    AppLocalizations.of(context)!.deleteAvatar,
                    style: const TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    Navigator.of(modalContext).pop();
                    _deleteAvatar(context, userId);
                  },
                ),
              ],
              ListTile(
                leading: const Icon(Icons.cancel),
                title: Text(AppLocalizations.of(context)!.cancel),
                onTap: () => Navigator.of(modalContext).pop(),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromGallery(
    BuildContext context,
    String userId,
  ) async {
    try {
      final avatarService = context.read<AvatarService>();
      final imageFile = await avatarService.pickImageFromGallery();

      if (imageFile != null && context.mounted) {
        await _uploadAvatar(context, imageFile, userId);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${AppLocalizations.of(context)!.imageSelectionError}: $e',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _takePhotoWithCamera(BuildContext context, String userId) async {
    try {
      final avatarService = context.read<AvatarService>();
      final imageFile = await avatarService.takePhotoWithCamera();

      if (imageFile != null && context.mounted) {
        await _uploadAvatar(context, imageFile, userId);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${AppLocalizations.of(context)!.photoCaptureError}: $e',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _uploadAvatar(
    BuildContext context,
    File imageFile,
    String userId,
  ) async {
    try {
      debugPrint('📸 ProfilePage: Starting avatar save for user: $userId');

      final avatarService = context.read<AvatarService>();

      debugPrint('📸 ProfilePage: Saving avatar locally...');
      final avatarPath = await avatarService.saveAvatarLocally(
        imageFile: imageFile,
        userId: userId,
      );

      if (avatarPath != null) {
        debugPrint('📸 ProfilePage: Avatar saved locally: $avatarPath');

        setState(() {
          _localAvatarPath = avatarPath;
        });

        debugPrint('✅ ProfilePage: Avatar save process completed successfully');

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                AppLocalizations.of(context)!.avatarSavedSuccessfully,
              ),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        debugPrint('❌ ProfilePage: Avatar save returned null path');
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)!.avatarSaveError),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('❌ ProfilePage: Error saving avatar: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка сохранения аватарки: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _deleteAvatar(BuildContext context, String userId) async {
    try {
      debugPrint('🗑️ ProfilePage: Starting avatar deletion for user: $userId');

      final avatarService = context.read<AvatarService>();
      final success = await avatarService.deleteAvatar(userId);

      if (success && context.mounted) {
        setState(() {
          _localAvatarPath = null;
        });

        debugPrint('✅ ProfilePage: Avatar deletion completed successfully');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.avatarDeleted),
            backgroundColor: Colors.green,
          ),
        );
      } else if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.avatarDeleteError),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      debugPrint('❌ ProfilePage: Error deleting avatar: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${AppLocalizations.of(context)!.avatarDeleteError}: $e',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.logoutConfirm),
          content: Text(AppLocalizations.of(context)!.logoutConfirmMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<AuthBloc>().add(const LogoutEvent());
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text(AppLocalizations.of(context)!.logout),
            ),
          ],
        );
      },
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.changePassword),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: currentPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.currentPassword,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(
                          context,
                        )!.enterCurrentPassword;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: newPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.newPassword,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.enterNewPassword;
                      }
                      if (value.length < 6) {
                        return AppLocalizations.of(context)!.passwordMinLength;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(
                        context,
                      )!.confirmNewPassword,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(
                          context,
                        )!.pleaseConfirmPassword;
                      }
                      if (value != newPasswordController.text) {
                        return AppLocalizations.of(
                          context,
                        )!.passwordsDoNotMatch;
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state is AuthLoading
                      ? null
                      : () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                              ChangePasswordEvent(
                                currentPassword: currentPasswordController.text,
                                newPassword: newPasswordController.text,
                              ),
                            );
                            Navigator.of(dialogContext).pop();
                          }
                        },
                  child: state is AuthLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(AppLocalizations.of(context)!.changePassword),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
