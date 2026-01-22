import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/app_services.dart';
import '../../app/router/routes/result_route.dart';
import '../../l10n/l10n.dart';
import '../../models/model.dart';
import 'answer_option_widget.dart';

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
  final Map<int, Set<String>> _selectedAnswers = {};
  String? _category;
  bool _hasLoaded = false;

  @override
  void initState() {
    super.initState();
    _category = widget.state.uri.queryParameters['category'];
    if (_category == null) {
      setState(() {
        _error = 'Категория не указана';
        _isLoading = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasLoaded && _category != null) {
      _hasLoaded = true;
      _loadQuestions();
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
            AnswerOptionWidget(
              answerKey: 'answer_a',
              answerText: question.answers.answerA,
              isSelected: _isAnswerSelected('answer_a'),
              isMultiple: question.multipleCorrectAnswers == 'true',
              onTap: () => _onAnswerSelected('answer_a'),
            ),
            AnswerOptionWidget(
              answerKey: 'answer_b',
              answerText: question.answers.answerB,
              isSelected: _isAnswerSelected('answer_b'),
              isMultiple: question.multipleCorrectAnswers == 'true',
              onTap: () => _onAnswerSelected('answer_b'),
            ),
            AnswerOptionWidget(
              answerKey: 'answer_c',
              answerText: question.answers.answerC,
              isSelected: _isAnswerSelected('answer_c'),
              isMultiple: question.multipleCorrectAnswers == 'true',
              onTap: () => _onAnswerSelected('answer_c'),
            ),
            AnswerOptionWidget(
              answerKey: 'answer_d',
              answerText: question.answers.answerD,
              isSelected: _isAnswerSelected('answer_d'),
              isMultiple: question.multipleCorrectAnswers == 'true',
              onTap: () => _onAnswerSelected('answer_d'),
            ),
            if (question.answers.answerE != null)
              AnswerOptionWidget(
                answerKey: 'answer_e',
                answerText: question.answers.answerE!,
                isSelected: _isAnswerSelected('answer_e'),
                isMultiple: question.multipleCorrectAnswers == 'true',
                onTap: () => _onAnswerSelected('answer_e'),
              ),
            if (question.answers.answerF != null)
              AnswerOptionWidget(
                answerKey: 'answer_f',
                answerText: question.answers.answerF!,
                isSelected: _isAnswerSelected('answer_f'),
                isMultiple: question.multipleCorrectAnswers == 'true',
                onTap: () => _onAnswerSelected('answer_f'),
              ),
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

}
