import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/app_services.dart';
import '../../app/router/routes/app_screens.dart';
import '../../l10n/l10n.dart';
import '../../models/model.dart';

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
            _DifficultyOption(
              title: l10n?.all_difficulties ?? 'Все сложности',
              subtitle:
                  l10n?.all_difficulties_desc ??
                  'Показать вопросы всех уровней сложности',
              value: 'All',
              onTap: () => Navigator.of(context).pop('All'),
            ),
            const Divider(),
            _DifficultyOption(
              title: 'Easy',
              subtitle: l10n?.easy_questions ?? 'Простые вопросы',
              value: 'easy',
              onTap: () => Navigator.of(context).pop('easy'),
            ),
            _DifficultyOption(
              title: 'Medium',
              subtitle: l10n?.medium_questions ?? 'Вопросы средней сложности',
              value: 'medium',
              onTap: () => Navigator.of(context).pop('medium'),
            ),
            _DifficultyOption(
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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _categories.isEmpty && _error == null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.category_outlined,
                      size: 64,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Категории не загружены',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Нажмите кнопку для загрузки категорий из QuizAPI',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.download),
                      label: const Text('Загрузить категории'),
                      onPressed: _loadCategories,
                    ),
                  ],
                ),
              ),
            )
          : _error != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n?.error_loading_categories ??
                          'Ошибка загрузки категорий',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _error!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.refresh),
                      label: Text(
                        (_error?.contains('Rate limit') == true ||
                                _error?.contains('429') == true)
                            ? 'Повторить через 2 мин'
                            : (l10n?.retry ?? 'Повторить'),
                      ),
                      onPressed: () async {
                        if (_error?.contains('Rate limit') == true ||
                            _error?.contains('429') == true) {
                          // Ждем 2 минуты перед повтором при rate limit
                          setState(() => _isLoading = true);
                          await Future<void>.delayed(const Duration(minutes: 2));
                        }
                        _loadCategories();
                      },
                    ),
                  ],
                ),
              ),
            )
          : _categories.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.category_outlined,
                      size: 64,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n?.categories_not_found ?? 'Категории не найдены',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.refresh),
                      label: Text(l10n?.refresh ?? 'Обновить'),
                      onPressed: _loadCategories,
                    ),
                  ],
                ),
              ),
            )
          : RefreshIndicator(
              onRefresh: _loadCategories,
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  return _CategoryCard(
                    category: category,
                    onTap: () => _onCategorySelected(category),
                  );
                },
              ),
            ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const _CategoryCard({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getCategoryIcon(category.name),
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 12),
              Text(
                category.name,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (category.description != null) ...[
                const SizedBox(height: 8),
                Text(
                  category.description!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String categoryName) {
    final name = categoryName.toLowerCase();
    if (name.contains('linux')) return Icons.code;
    if (name.contains('devops')) return Icons.cloud;
    if (name.contains('docker')) return Icons.storage;
    if (name.contains('sql')) return Icons.storage;
    if (name.contains('code')) return Icons.code;
    if (name.contains('bash')) return Icons.terminal;
    if (name.contains('uncategorized')) return Icons.help_outline;
    return Icons.category;
  }
}

class _DifficultyOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final VoidCallback onTap;

  const _DifficultyOption({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(
              _getDifficultyIcon(value),
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getDifficultyIcon(String difficulty) {
    switch (difficulty) {
      case 'Easy':
        return Icons.sentiment_satisfied;
      case 'Medium':
        return Icons.sentiment_neutral;
      case 'Hard':
        return Icons.sentiment_dissatisfied;
      case 'All':
      default:
        return Icons.all_inclusive;
    }
  }
}
