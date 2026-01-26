import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/models/app_services.dart';
import '../../app/router/routes/app_screens.dart';
import '../../l10n/l10n.dart';
import 'info_row_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isUploading = false;

  Future<void> _handleLogout(BuildContext context) async {
    final authService = AppServices.of(context).authService;
    final l10n = S.of(context);
    try {
      await authService.signOut();
      if (context.mounted) {
        context.go(AppScreens.login.routePath);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n?.logout_error_message(e.toString()) ??
                  'Ошибка при выходе: $e',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final authService = AppServices.of(context).authService;
    final User? user = authService.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text(l10n?.profile ?? 'Профиль')),
      body: user == null
          ? Center(
              child: Text(
                l10n?.user_not_authorized ?? 'Пользователь не авторизован',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  // Аватар пользователя
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(
                        user.email?.substring(0, 1).toUpperCase() ?? 'U',
                        style: const TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Информация о пользователе
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n?.user_info ?? 'Информация о пользователе',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          InfoRow(
                            icon: Icons.email,
                            label: l10n?.email ?? 'Почта',
                            value:
                                user.email ??
                                (l10n?.not_specified ?? 'Не указано'),
                          ),
                          const SizedBox(height: 12),
                          InfoRow(
                            icon: Icons.person,
                            label: l10n?.uid ?? 'UID',
                            value: user.uid,
                          ),
                          if (user.displayName != null) ...[
                            const SizedBox(height: 12),
                            InfoRow(
                              icon: Icons.badge,
                              label: l10n?.name ?? 'Имя',
                              value: user.displayName!,
                            ),
                          ],
                          if (user.phoneNumber != null) ...[
                            const SizedBox(height: 12),
                            InfoRow(
                              icon: Icons.phone,
                              label: l10n?.phone ?? 'Телефон',
                              value: user.phoneNumber!,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Тестирование Firebase Storage
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n?.storage_testing ?? 'Тестирование Storage',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _isUploading
                                      ? null
                                      : _testStorageUpload,
                                  icon: _isUploading
                                      ? const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : const Icon(Icons.cloud_upload),
                                  label: Text(
                                    l10n?.upload_test ?? 'Загрузить тест',
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: _testStorageDownload,
                                  icon: const Icon(Icons.cloud_download),
                                  label: Text(
                                    l10n?.check_files ?? 'Проверить файлы',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: _isUploading ? null : _uploadImage,
                              icon: const Icon(Icons.image),
                              label: Text(
                                l10n?.upload_image ?? 'Загрузить изображение',
                              ),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Кнопка выхода
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.logout),
                      label: Text(
                        l10n?.logout ?? 'Выйти',
                        style: const TextStyle(fontSize: 18),
                      ),
                      onPressed: () => _handleLogout(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Кнопка возврата на главную
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.home),
                      label: Text(
                        l10n?.main ?? 'Главная',
                        style: const TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        context.go(AppScreens.home.routePath);
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> _testStorageUpload() async {
    final appServices = AppServices.of(context);
    final l10n = S.of(context);
    final user = appServices.authService.currentUser;

    if (user == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n?.user_not_authorized ?? 'Пользователь не авторизован'),
            backgroundColor: Colors.orange,
          ),
        );
      }
      return;
    }

    setState(() {
      _isUploading = true;
    });

    try {
      // Создаем тестовый текстовый файл
      final testContent = 'Hello from ${user.email} at ${DateTime.now()}';
      final bytes = Uint8List.fromList(testContent.codeUnits);

      // Загружаем в Storage
      final path =
          'test/${user.uid}/test_file_${DateTime.now().millisecondsSinceEpoch}.txt';
      
      // Выполняем загрузку с таймаутом на уровне UI
      final downloadUrl = await appServices.storageService.uploadBytes(
        path,
        bytes,
      ).timeout(
        const Duration(seconds: 35),
        onTimeout: () {
          throw Exception('Upload operation timed out. Please check your internet connection and Firebase Storage configuration.');
        },
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n?.file_uploaded('${downloadUrl.substring(0, 50)}...') ??
                  'Файл загружен! URL: ${downloadUrl.substring(0, 50)}...',
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        String errorMessage = e.toString();
        
        // Более понятные сообщения об ошибках
        if (errorMessage.contains('timeout')) {
          errorMessage = 'Превышено время ожидания. Проверьте подключение к интернету и настройки Firebase Storage.';
        } else if (errorMessage.contains('permission-denied')) {
          errorMessage = 'Нет доступа к Firebase Storage. Проверьте правила безопасности.';
        } else if (errorMessage.contains('object-not-found')) {
          errorMessage = 'Объект не найден. Возможно, проблема с правилами безопасности Firebase Storage.';
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n?.upload_error(errorMessage) ?? 'Ошибка загрузки: $errorMessage',
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  Future<void> _testStorageDownload() async {
    final appServices = AppServices.of(context);
    final l10n = S.of(context);
    final user = appServices.authService.currentUser;

    if (user == null) return;

    try {
      // Пытаемся получить URL последнего загруженного файла
      final path = 'test/${user.uid}/';
      final listResult = await appServices.storage.ref().child(path).list();

      if (listResult.items.isNotEmpty) {
        final lastItem = listResult.items.last;

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                l10n?.last_file(lastItem.name) ??
                    'Последний файл: ${lastItem.name}',
              ),
              backgroundColor: Colors.blue,
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n?.files_not_found ?? 'Файлы не найдены'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n?.error(e.toString()) ?? 'Ошибка: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _uploadImage() async {
    final appServices = AppServices.of(context);
    final l10n = S.of(context);
    final user = appServices.authService.currentUser;

    if (user == null) return;

    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image == null) return;

      setState(() {
        _isUploading = true;
      });

      final file = File(image.path);
      final path =
          'images/${user.uid}/profile_${DateTime.now().millisecondsSinceEpoch}.jpg';
      await appServices.storageService.uploadFile(path, file);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n?.image_uploaded ?? 'Изображение загружено!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n?.image_upload_error(e.toString()) ??
                  'Ошибка загрузки изображения: $e',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }
}
