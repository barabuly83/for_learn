import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import '../../core/error/error_localizer.dart';
import '../../l10n/app_localizations.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../bloc/login_form_cubit.dart';
import '../forms/login_form_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthBloc _authBloc;
  late final StreamSubscription<AuthState> _authSubscription;
  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
    _authSubscription = _authBloc.stream.listen(_onAuthStateChanged);
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }

  void _onAuthStateChanged(AuthState state) {
    debugPrint(
      '🎧 LoginPage: Direct stream listener triggered with state: ${state.runtimeType}',
    );

    // Handle AuthFailureState - show error snackbar
    if (state is AuthFailureState) {
      debugPrint(
        '❌ LoginPage: Direct stream showing AuthFailureState: ${state.failure.code}',
      );
      debugPrint('🎧 LoginPage: mounted=$mounted');
      if (mounted) {
        debugPrint('🎧 LoginPage: Scheduling snackbar display');
        WidgetsBinding.instance.addPostFrameCallback((_) {
          debugPrint(
            '🎧 LoginPage: Executing post-frame callback, mounted=$mounted',
          );
          if (mounted) {
            try {
              final scaffoldMessenger = ScaffoldMessenger.of(context);
              scaffoldMessenger.clearSnackBars();
              final localizedMessage = ErrorLocalizer.localize(
                context,
                state.failure,
              );
              scaffoldMessenger.showSnackBar(
                SnackBar(
                  content: Text(localizedMessage),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 5),
                  action: SnackBarAction(
                    label: 'OK',
                    textColor: Colors.white,
                    onPressed: () {
                      scaffoldMessenger.clearSnackBars();
                    },
                  ),
                ),
              );
              debugPrint('✅ LoginPage: Snackbar displayed successfully');
            } catch (e) {
              debugPrint('❌ LoginPage: Error displaying snackbar: $e');
            }
          } else {
            debugPrint('❌ LoginPage: Widget not mounted during callback');
          }
        });
      } else {
        debugPrint('❌ LoginPage: Widget not mounted when scheduling snackbar');
      }
    }
    // Handle PasswordResetSuccess - show success snackbar
    else if (state is PasswordResetSuccess) {
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            try {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(context)!.passwordResetSent,
                  ),
                  backgroundColor: Colors.green,
                ),
              );
            } catch (e) {
              debugPrint(
                '❌ LoginPage: Error displaying password reset snackbar: $e',
              );
            }
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🔍 LoginPage: Building with AuthBloc context');

    return BlocProvider.value(
      value: context.read<LoginFormCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.login),
          centerTitle: true,
        ),
        body: BlocBuilder<LoginFormCubit, LoginFormState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    AppLocalizations.of(context)!.welcome,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)!.loginToAccount,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  _EmailInput(),
                  const SizedBox(height: 16),
                  _PasswordInput(),
                  const SizedBox(height: 8),
                  _ForgotPasswordButton(),
                  const SizedBox(height: 24),
                  _LoginButton(),
                  const SizedBox(height: 16),
                  _SignUpButton(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Email input field widget
class _EmailInput extends StatefulWidget {
  @override
  State<_EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<_EmailInput> {
  String? _authError;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailureState) {
          final localizedMessage = ErrorLocalizer.localize(
            context,
            state.failure,
          );
          setState(() {
            _authError = localizedMessage;
          });
        } else if (state is AuthLoading || state is Authenticated) {
          setState(() {
            _authError = null;
          });
        }
      },
      child: BlocBuilder<LoginFormCubit, LoginFormState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextField(
            key: const Key('loginForm_emailInput_textField'),
            autofocus: true,
            onChanged: (email) {
              // Clear auth error when user starts typing
              if (_authError != null) {
                setState(() {
                  _authError = null;
                });
              }
              context.read<LoginFormCubit>().emailChanged(email);
            },
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.email,
              hintText: 'user@example.com',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.email),
              errorText:
                  _authError ??
                  (state.email.displayError != null
                      ? AppLocalizations.of(context)!.enterValidEmail
                      : null),
              errorMaxLines: 2,
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          );
        },
      ),
    );
  }
}

/// Password input field widget
class _PasswordInput extends StatefulWidget {
  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  bool _obscurePassword = true;
  String? _authError;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailureState) {
          final localizedMessage = ErrorLocalizer.localize(
            context,
            state.failure,
          );
          setState(() {
            _authError = localizedMessage;
          });
        } else if (state is AuthLoading || state is Authenticated) {
          setState(() {
            _authError = null;
          });
        }
      },
      child: BlocBuilder<LoginFormCubit, LoginFormState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return TextField(
            key: const Key('loginForm_passwordInput_textField'),
            onChanged: (password) {
              // Clear auth error when user starts typing
              if (_authError != null) {
                setState(() {
                  _authError = null;
                });
              }
              context.read<LoginFormCubit>().passwordChanged(password);
            },
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.password,
              hintText: AppLocalizations.of(context)!.enterPassword,
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              errorText:
                  _authError ??
                  (state.password.displayError != null
                      ? AppLocalizations.of(context)!.passwordMin6Characters
                      : null),
              errorMaxLines: 2,
            ),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            obscureText: _obscurePassword,
          );
        },
      ),
    );
  }
}

/// Forgot password button
class _ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => _showForgotPasswordDialog(context),
        child: Text(AppLocalizations.of(context)!.forgotPassword),
      ),
    );
  }

  void _showForgotPasswordDialog(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        // Ensure controller is disposed when dialog is dismissed
        return PopScope(
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              emailController.dispose();
            }
          },
          child: AlertDialog(
            title: Text(AppLocalizations.of(context)!.passwordRecovery),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppLocalizations.of(context)!.enterEmailForPasswordReset),
                const SizedBox(height: 16),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.email,
                    hintText: 'user@example.com',
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  emailController.dispose();
                  Navigator.of(dialogContext).pop();
                },
                child: Text(AppLocalizations.of(context)!.cancel),
              ),
              ElevatedButton(
                onPressed: () {
                  final email = emailController.text.trim();
                  if (email.isNotEmpty) {
                    context.read<AuthBloc>().add(
                      PasswordResetEvent(email: email),
                    );
                    emailController.dispose();
                    Navigator.of(dialogContext).pop();
                  }
                },
                child: Text(AppLocalizations.of(context)!.send),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Login button
class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormCubit, LoginFormState>(
      builder: (context, state) {
        debugPrint('🔄 LoginButton: Building with status: ${state.status}');

        if (state.status.isInProgress) {
          return const CircularProgressIndicator();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              key: const Key('loginForm_continue_raisedButton'),
              onPressed: state.isValid && !state.status.isFailure
                  ? () => context.read<LoginFormCubit>().submit()
                  : null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: state.status.isFailure ? Colors.red : null,
              ),
              child: Text(
                state.status.isFailure
                    ? AppLocalizations.of(context)!.loginError
                    : AppLocalizations.of(context)!.login,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            if (state.status.isFailure) ...[
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.checkEmailAndPassword,
                style: TextStyle(color: Colors.red.shade700, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        );
      },
    );
  }
}

/// Sign up navigation button
class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppLocalizations.of(context)!.dontHaveAccount),
        TextButton(
          onPressed: () => context.go('/register'),
          child: Text(AppLocalizations.of(context)!.register),
        ),
      ],
    );
  }
}
