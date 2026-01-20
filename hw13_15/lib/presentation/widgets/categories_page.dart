import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/services/app_services.dart';
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
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadCategories();
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
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _onCategorySelected(Category category) {
    context.push(
      '${AppScreens.questions.routePath}?category=${Uri.encodeComponent(category.name)}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.select_category ?? 'Выберите категорию'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ошибка: $_error',
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadCategories,
                        child: const Text('Повторить'),
                      ),
                    ],
                  ),
                )
              : _categories.isEmpty
                  ? Center(
                      child: Text(
                        'Категории не найдены',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  : ListView.builder(
                      itemCount: _categories.length,
                      itemBuilder: (context, index) {
                        final category = _categories[index];
                        return ListTile(
                          title: Text(category.name),
                          subtitle: category.description != null
                              ? Text(category.description!)
                              : null,
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () => _onCategorySelected(category),
                        );
                      },
                    ),
    );
  }
}
