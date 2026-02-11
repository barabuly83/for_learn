import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<LoginFormCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Вход'), centerTitle: true),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              // Reset the form after successful login
              context.read<LoginFormCubit>().reset();
              context.go('/home');
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is PasswordResetSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Письмо для восстановления пароля отправлено на ваш email',
                  ),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          child: BlocBuilder<LoginFormCubit, LoginFormState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 32),
                    const Text(
                      'Добро пожаловать',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Войдите в свой аккаунт',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
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
      ),
    );
  }
}

/// Email input field widget
class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormCubit, LoginFormState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          autofocus: true,
          onChanged: (email) =>
              context.read<LoginFormCubit>().emailChanged(email),
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'example@email.com',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.email),
            errorText: state.email.displayError != null
                ? 'Введите корректный email'
                : null,
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        );
      },
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormCubit, LoginFormState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginFormCubit>().passwordChanged(password),
          decoration: InputDecoration(
            labelText: 'Пароль',
            hintText: 'Введите пароль',
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
            errorText: state.password.displayError != null
                ? 'Пароль должен содержать минимум 6 символов'
                : null,
          ),
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: _obscurePassword,
        );
      },
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
        child: const Text('Забыли пароль?'),
      ),
    );
  }

  void _showForgotPasswordDialog(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Восстановление пароля'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Введите ваш email адрес. Мы отправим вам письмо с инструкциями по восстановлению пароля.',
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'example@email.com',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text.trim();
                if (email.isNotEmpty) {
                  context.read<AuthBloc>().add(PasswordResetEvent(email: email));
                  Navigator.of(dialogContext).pop();
                }
              },
              child: const Text('Отправить'),
            ),
          ],
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
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: state.isValid
                    ? () => context.read<LoginFormCubit>().submit()
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Войти', style: TextStyle(fontSize: 16)),
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
        const Text('Нет аккаунта? '),
        TextButton(
          onPressed: () => context.go('/register'),
          child: const Text('Зарегистрироваться'),
        ),
      ],
    );
  }
}
