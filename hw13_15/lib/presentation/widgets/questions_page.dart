import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/services/app_services.dart';
import '../../app/router/routes/result_route.dart';
import '../../l10n/l10n.dart';
import '../../models/model.dart';

class QuestionsPage extends StatefulWidget {
  final GoRouterState state;

  const QuestionsPage({
    super.key,
    required this.state,
  });

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  List<Question> _questions = [];
  bool _isLoading = true;
  String? _error;
  int _currentQuestionIndex = 0;
  Map<int, Set<String>> _selectedAnswers = {};
  String? _category;

  @override
  void initState() {
    super.initState();
    _category = widget.state.uri.queryParameters['category'];
    if (_category != null) {
      _loadQuestions();
    } else {
      setState(() {
        _error = 'Категория не указана';
        _isLoading = false;
      });
    }
  }

  Future<void> _loadQuestions() async {
    if (_category == null) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final quizService = AppServices.of(context).quizService;
      final questions = await quizService.fetchQuestions(_category!);
      setState(() {
        _questions = questions;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _onAnswerSelected(String answerKey) {
    setState(() {
      final questionIndex = _currentQuestionIndex;
      _selectedAnswers.putIfAbsent(questionIndex, () => <String>{});
      final question = _questions[questionIndex];
      
      if (question.multipleCorrectAnswers == 'true') {
        // Множественный выбор
        if (_selectedAnswers[questionIndex]!.contains(answerKey)) {
          _selectedAnswers[questionIndex]!.remove(answerKey);
        } else {
          _selectedAnswers[questionIndex]!.add(answerKey);
        }
      } else {
        // Одиночный выбор
        _selectedAnswers[questionIndex]!.clear();
        _selectedAnswers[questionIndex]!.add(answerKey);
      }
    });
  }

  bool _isAnswerSelected(String answerKey) {
    return _selectedAnswers[_currentQuestionIndex]?.contains(answerKey) ?? false;
  }

  void _onNextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _finishQuiz();
    }
  }

  void _onPreviousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  void _finishQuiz() {
    int correctCount = 0;
    
    for (int i = 0; i < _questions.length; i++) {
      final question = _questions[i];
      final selected = _selectedAnswers[i] ?? <String>{};
      final correctAnswers = question.correctAnswers;
      
      bool isCorrect = true;
      for (var entry in correctAnswers.entries) {
        final key = entry.key;
        final value = entry.value;
        final shouldBeSelected = value == 'true';
        final isSelected = selected.contains(key);
        
        if (shouldBeSelected != isSelected) {
          isCorrect = false;
          break;
        }
      }
      
      if (isCorrect) {
        correctCount++;
      }
    }

    final resultRoute = ResultRoute();
    resultRoute.push(
      GoRouter.of(context),
      category: _category ?? '',
      countCorrectAnswers: correctCount.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n?.question('1', '1') ?? 'Вопрос'),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null || _questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n?.question('1', '1') ?? 'Вопрос'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _error ?? 'Вопросы не найдены',
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadQuestions,
                child: const Text('Повторить'),
              ),
            ],
          ),
        ),
      );
    }

    final question = _questions[_currentQuestionIndex];
    final questionNumber = _currentQuestionIndex + 1;
    final totalQuestions = _questions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.question(
          questionNumber.toString(),
          totalQuestions.toString(),
        ) ?? 'Вопрос $questionNumber/$totalQuestions'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            if (question.description.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                question.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
            const SizedBox(height: 24),
            _buildAnswerOption('answer_a', question.answers.answerA),
            _buildAnswerOption('answer_b', question.answers.answerB),
            _buildAnswerOption('answer_c', question.answers.answerC),
            _buildAnswerOption('answer_d', question.answers.answerD),
            if (question.answers.answerE != null)
              _buildAnswerOption('answer_e', question.answers.answerE!),
            if (question.answers.answerF != null)
              _buildAnswerOption('answer_f', question.answers.answerF!),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed:
                      _currentQuestionIndex > 0 ? _onPreviousQuestion : null,
                  child: Text(l10n?.back ?? 'Назад'),
                ),
                ElevatedButton(
                  onPressed: _onNextQuestion,
                  child: Text(_currentQuestionIndex < _questions.length - 1
                      ? 'Далее'
                      : 'Завершить'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerOption(String answerKey, String answerText) {
    final isSelected = _isAnswerSelected(answerKey);
    final question = _questions[_currentQuestionIndex];
    final isMultiple = question.multipleCorrectAnswers == 'true';

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _onAnswerSelected(answerKey),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? Colors.blue.withOpacity(0.1) : null,
          ),
          child: Row(
            children: [
              isMultiple
                  ? Checkbox(
                      value: isSelected,
                      onChanged: (_) => _onAnswerSelected(answerKey),
                    )
                  : Radio<bool>(
                      value: true,
                      groupValue: isSelected,
                      onChanged: (_) => _onAnswerSelected(answerKey),
                    ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  answerText,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
