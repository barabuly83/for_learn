import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/app_services.dart';
import '../../app/router/routes/app_screens.dart';
import '../../l10n/l10n.dart';
import '../../models/model.dart';
import 'categories_loading_widget.dart';
import 'categories_empty_widget.dart';
import 'categories_error_widget.dart';
import 'categories_not_found_widget.dart';
import 'categories_grid_widget.dart';
import 'difficulty_option_widget.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<Category> _categories = [];
  bool _isLoading = true; // Начинаем с true для автоматической загрузки
  String? _error;
  bool _hasLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasLoaded) {
      _hasLoaded = true;
      _loadCategories();
    }
  }

  Future<void> _loadCategories() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final quizService = AppServices.of(context).quizService;
      final categories = await quizService.fetchCategories();
      setState(() {
        _categories = categories;
        _isLoading = false;
      });
    } catch (e) {
      String errorMessage = 'Ошибка загрузки категорий';

      // Обработка специфических ошибок
      final errorString = e.toString();
      if (errorString.contains('API Cooldown')) {
        // Извлекаем количество секунд из сообщения
        final match = RegExp(r'wait (\d+) seconds').firstMatch(errorString);
        final seconds = match?.group(1) ?? '60';
        final minutes = (int.tryParse(seconds) ?? 60) ~/ 60;
        if (minutes > 0) {
          errorMessage =
              'Превышен лимит запросов. Подождите $minutes ${minutes == 1 ? 'минуту' : 'минуты'} и попробуйте снова.';
        } else {
          errorMessage =
              'Превышен лимит запросов. Подождите $seconds секунд и попробуйте снова.';
        }
      } else if (errorString.contains('Rate limit exceeded') ||
          errorString.contains('429')) {
        // Извлекаем количество минут из сообщения, если указано
        final minutesMatch = RegExp(
          r'wait (\d+) minutes?',
        ).firstMatch(errorString);
        final minutes = minutesMatch?.group(1) ?? '5-10';
        errorMessage =
            'Превышен лимит запросов к API (429). Возможные причины:\n'
            '• Лимит по IP адресу (особенно на веб-платформе)\n'
            '• Временная блокировка после предыдущих запросов\n'
            '• Проверьте статус вашего API ключа на quizapi.io\n\n'
            'Подождите $minutes минут и попробуйте снова.';
      } else if (errorString.contains('401') || errorString.contains('403')) {
        errorMessage = 'Ошибка аутентификации API. Проверьте API ключ.';
      } else if (errorString.contains('500')) {
        errorMessage = 'Ошибка сервера QuizAPI. Попробуйте позже.';
      } else if (errorString.contains('Failed to fetch categories')) {
        errorMessage =
            'Не удалось загрузить категории. Проверьте подключение к интернету.';
      }

      setState(() {
        _error = errorMessage;
        _isLoading = false;
      });
    }
  }

  void _onCategorySelected(Category category) async {
    final difficulty = await _showDifficultyDialog();
    if (difficulty != null) {
      final queryParams = <String, String>{'category': category.name};
      if (difficulty != 'All') {
        queryParams['difficulty'] = difficulty;
      }

      final queryString = queryParams.entries
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
          .join('&');

      if (mounted) {
        context.push('${AppScreens.questions.routePath}?$queryString');
      }
    }
  }

  Future<String?> _showDifficultyDialog() async {
    final l10n = S.of(context);
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n?.select_difficulty ?? 'Выберите сложность'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DifficultyOptionWidget(
              title: l10n?.all_difficulties ?? 'Все сложности',
              subtitle:
                  l10n?.all_difficulties_desc ??
                  'Показать вопросы всех уровней сложности',
              value: 'All',
              onTap: () => Navigator.of(context).pop('All'),
            ),
            const Divider(),
            DifficultyOptionWidget(
              title: 'Easy',
              subtitle: l10n?.easy_questions ?? 'Простые вопросы',
              value: 'easy',
              onTap: () => Navigator.of(context).pop('easy'),
            ),
            DifficultyOptionWidget(
              title: 'Medium',
              subtitle: l10n?.medium_questions ?? 'Вопросы средней сложности',
              value: 'medium',
              onTap: () => Navigator.of(context).pop('medium'),
            ),
            DifficultyOptionWidget(
              title: 'Hard',
              subtitle: l10n?.hard_questions ?? 'Сложные вопросы',
              value: 'hard',
              onTap: () => Navigator.of(context).pop('hard'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n?.cancel ?? 'Отмена'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.select_category ?? 'Выберите категорию'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: l10n?.refresh ?? 'Обновить',
            onPressed: _loadCategories,
          ),
        ],
      ),
      body: _buildBodyWidget(context, l10n),
    );
  }

  Widget _buildBodyWidget(BuildContext context, S? l10n) {
    if (_isLoading) {
      return const CategoriesLoadingWidget();
    }

    if (_categories.isEmpty && _error == null) {
      return CategoriesEmptyWidget(onLoadCategories: _loadCategories);
    }

    if (_error != null) {
      return CategoriesErrorWidget(
        error: _error,
        onRetry: _loadCategories,
      );
    }

    if (_categories.isEmpty) {
      return CategoriesNotFoundWidget(onRefresh: _loadCategories);
    }

    return RefreshIndicator(
      onRefresh: _loadCategories,
      child: CategoriesGridWidget(
        categories: _categories,
        onCategorySelected: _onCategorySelected,
      ),
    );
  }
}


