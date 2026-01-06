import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/login_view_model.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/login_logo.dart';
import '../widgets/login_button.dart';
import '../widgets/or_divider.dart';
import '../widgets/link_text.dart';
import '../constants/app_constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin(LoginViewModel viewModel) {
    if (_formKey.currentState!.validate()) {
      final credentials = viewModel.createCredentials(
        _emailController.text,
        _passwordController.text,
      );

      if (credentials != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Вход выполнен успешно!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  void _handleForgotPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Функция восстановления пароля'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleCreateAccount() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Переход к созданию аккаунта'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleLogoTap() {
    debugPrint('Логотип нажат');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppConstants.spacingLarge),
              child: Consumer<LoginViewModel>(
                builder: (context, viewModel, child) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Логотип
                        Center(
                          child: LoginLogo(
                            onTap: _handleLogoTap,
                          ),
                        ),
                        const SizedBox(height: AppConstants.spacingXXLarge),

                        // Заголовок
                        Text(
                          'Вход в систему',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppConstants.spacingXLarge),

                        // Поле Email
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          validator: viewModel.validateEmail,
                        ),
                        const SizedBox(height: AppConstants.spacingMedium),

                        // Поле Пароль
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Пароль',
                          prefixIcon: Icons.lock_outlined,
                          obscureText: !viewModel.isPasswordVisible,
                          suffixIcon: IconButton(
                            icon: Icon(
                              viewModel.isPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: () {
                              viewModel.togglePasswordVisibility();
                            },
                          ),
                          validator: viewModel.validatePassword,
                        ),
                        const SizedBox(height: AppConstants.spacingSmall),

                        // Ссылка "Забыли пароль?"
                        LinkText(
                          text: 'Забыли пароль?',
                          onTap: _handleForgotPassword,
                          alignment: Alignment.centerRight,
                          color: AppConstants.lightBlueLink,
                        ),
                        const SizedBox(height: AppConstants.spacingXLarge),

                        // Кнопка "Войти"
                        LoginButton(
                          onPressed: () => _handleLogin(viewModel),
                        ),
                        const SizedBox(height: AppConstants.spacingLarge),

                        // Разделитель "или"
                        const OrDivider(),
                        const SizedBox(height: AppConstants.spacingLarge),

                        // Ссылка "Создать новый аккаунт"
                        LinkText(
                          text: 'Создать новый аккаунт',
                          onTap: _handleCreateAccount,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

