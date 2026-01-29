import 'package:flutter/material.dart';
import '../../domain/models/app_services.dart';
import '../../l10n/l10n.dart';
import '../../models/quiz_result.dart';
import 'results_loading_widget.dart';
import 'results_error_widget.dart';
import 'results_empty_widget.dart';
import 'results_list_widget.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  List<QuizResult> _results = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    // Откладываем загрузку до следующего фрейма, когда контекст будет доступен
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadResults();
    });
  }

  Future<void> _loadResults() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Используем реальные данные из Firebase
      final quizService = AppServices.of(context).quizService;
      final results = await quizService.fetchQuizResults(limit: 20);

      setState(() {
        _results = results;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.quiz_history ?? 'История викторин'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: l10n?.refresh ?? 'Обновить',
            onPressed: () {
              // print('🔄 Manual refresh triggered');
              _loadResults();
            },
          ),
        ],
      ),
      body: _buildBodyWidget(context, l10n),
    );
  }

  Widget _buildBodyWidget(BuildContext context, S? l10n) {
    if (_isLoading) {
      return const ResultsLoadingWidget();
    }

    if (_error != null) {
      return ResultsErrorWidget(
        error: _error,
        onRetry: _loadResults,
      );
    }

    if (_results.isEmpty) {
      return const ResultsEmptyWidget();
    }

    return ResultsListWidget(
      results: _results,
      onRefresh: _loadResults,
    );
  }
}

