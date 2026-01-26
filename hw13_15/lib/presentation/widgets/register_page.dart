import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/app_services.dart';
import '../../l10n/l10n.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formState = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final AppServices appServices = AppServices.of(context);
    final bool isValidate = _formState.currentState?.validate() ?? false;

    if (isValidate) {
      final String email = _emailController.text;
      final String password = _passwordController.text;

      setState(() {
        _isLoading = true;
      });

      try {
        await appServices.authService.signUpWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (mounted) {
          context.go('/');
        }
      } on FirebaseAuthException catch (e) {
        if (mounted) {
          appServices.snackBarDispatcher(context, e.message ?? '');
        }
      } catch (e) {
        if (mounted) {
          appServices.snackBarDispatcher(context, e.toString());
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  Future<void> _registerWithGoogle() async {
    final AppServices appServices = AppServices.of(context);

    setState(() {
      _isLoading = true;
    });

    try {
      await appServices.authService.signInWithGoogle();
      if (mounted) {
        context.go('/');
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        appServices.snackBarDispatcher(context, e.message ?? '');
      }
    } catch (e) {
      if (mounted) {
        appServices.snackBarDispatcher(context, e.toString());
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.register),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: l10n.email,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.cannot_be_empty;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: l10n.password,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.cannot_be_empty;
                    }
                    if (value.length < 6) {
                      return l10n.password_min_length;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: l10n.confirm_password,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.cannot_be_empty;
                    }
                    if (value != _passwordController.text) {
                      return l10n.passwords_do_not_match;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _isLoading ? null : _register,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(l10n.register),
                ),
                const SizedBox(height: 16),
                // Кнопка регистрации через Google
                OutlinedButton.icon(
                  onPressed: _isLoading ? null : _registerWithGoogle,
                  icon: const Icon(Icons.g_mobiledata, size: 20),
                  label: Text(l10n.register_with_google),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
