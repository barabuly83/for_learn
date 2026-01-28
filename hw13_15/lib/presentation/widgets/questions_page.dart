import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/app_services.dart';
import '../../app/router/routes/result_route.dart';
import '../../l10n/l10n.dart';
import '../../models/model.dart';
import 'answer_option_widget.dart';

class QuestionsPage extends StatefulWidget {
  final GoRouterState state;

  const QuestionsPage({super.key, required this.state});

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
  String? _difficulty;
  bool _hasLoaded = false;

  @override
  void initState() {
    super.initState();
    _category = widget.state.uri.queryParameters['category'];
    _difficulty = widget.state.uri.queryParameters['difficulty'];
    if (_category == null) {
      final l10n = S.of(context);
      setState(() {
        _error = l10n?.category_not_specified ?? 'Категория не указана';
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

      // Используем новый метод с фильтрами для получения вопросов по категории
      // Нам больше не нужно получать список категорий здесь, так как API принимает имя категории
      final questions = await quizService.fetchQuestionsWithFilters(
        categoryName: _category!,
        limit:
            10, // Можно запрашивать 10, так как теперь фильтрация на стороне API
        difficulty: _difficulty == 'All' ? null : _difficulty,
      );

      if (questions.isEmpty) {
        throw Exception(
          'NO_QUESTIONS_FOUND:$_category:${_difficulty ?? 'any'}',
        );
      }

      setState(() {
        _questions = questions;
        _isLoading = false;
      });
    } catch (e) {
      // print('Error loading questions: $e');
      String errorMessage = 'Ошибка загрузки вопросов';

      // Пытаемся разобрать ошибку для более понятного сообщения
      final errorString = e.toString();
      if (errorString.contains('NO_QUESTIONS_FOUND:')) {
        // Специальная ошибка для пустого списка вопросов
        final parts = errorString.split(':');
        if (parts.length >= 3) {
          final category = parts[1];
          final difficulty = parts[2];
          final l10n = mounted ? S.of(context) : null;
          errorMessage =
              (l10n?.no_questions_found ??
                      'No questions found for category "$category" with difficulty "$difficulty"')
                  .toString();
        }
      } else if (errorString.contains('Rate limit exceeded')) {
        errorMessage =
            'Превышен лимит запросов к API. Подождите 1 минуту и попробуйте снова.';
      } else if (errorString.contains('QuizAPI Error:')) {
        errorMessage =
            'Ошибка QuizAPI: ${errorString.replaceFirst('QuizAPI Error:', '').trim()}';
      } else if (errorString.contains('404')) {
        errorMessage =
            'Вопросы для выбранной категории и сложности не найдены. Попробуйте другую комбинацию.';
      } else if (errorString.contains('401') || errorString.contains('403')) {
        errorMessage = 'Ошибка аутентификации API. Проверьте API ключ.';
      } else if (errorString.contains('429')) {
        errorMessage =
            'Слишком много запросов. Подождите немного и попробуйте снова.';
      } else if (errorString.contains('500')) {
        errorMessage = 'Ошибка сервера QuizAPI. Попробуйте позже.';
      }

      setState(() {
        _error = errorMessage;
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
    final selectedForCurrentQuestion = _selectedAnswers[_currentQuestionIndex];
    return selectedForCurrentQuestion?.contains(answerKey) ?? false;
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

    const resultRoute = ResultRoute();
    resultRoute.push(
      GoRouter.of(context),
      category: _category ?? '',
      countCorrectAnswers: correctCount.toString(),
    );
  }

  PreferredSizeWidget _buildAppBar(S? l10n, int questionNumber, int totalQuestions) {
    return AppBar(
      title: Text(
        l10n?.question(questionNumber.toString(), totalQuestions.toString()) ??
            'Вопрос $questionNumber/$totalQuestions',
      ),
    );
  }

  Widget _buildBody(Question question, S? l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.question,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if (question.description?.isNotEmpty == true) ...[
            const SizedBox(height: 8),
            Text(
              question.description!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
          const SizedBox(height: 24),
          ..._buildAnswerOptions(question),
          const SizedBox(height: 24),
          _buildNavigationButtons(l10n),
        ],
      ),
    );
  }

  List<Widget> _buildAnswerOptions(Question question) {
    final options = <Widget>[];

    final answerKeys = ['answer_a', 'answer_b', 'answer_c', 'answer_d', 'answer_e', 'answer_f'];
    final answers = [
      question.answers.answerA,
      question.answers.answerB,
      question.answers.answerC,
      question.answers.answerD,
      question.answers.answerE,
      question.answers.answerF,
    ];

    for (var i = 0; i < answerKeys.length; i++) {
      final answer = answers[i];
      if (answer != null) {
        options.add(
          AnswerOptionWidget(
            key: ValueKey(answerKeys[i]), // Добавляем key для оптимизации
            answerKey: answerKeys[i],
            answerText: answer,
            isSelected: _isAnswerSelected(answerKeys[i]),
            isMultiple: question.multipleCorrectAnswers == 'true',
            onTap: () => _onAnswerSelected(answerKeys[i]),
          ),
        );
      }
    }

    return options;
  }

  Widget _buildNavigationButtons(S? l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: _currentQuestionIndex > 0 ? _onPreviousQuestion : null,
          child: Text(l10n?.back ?? 'Назад'),
        ),
        ElevatedButton(
          onPressed: _onNextQuestion,
          child: Text(
            _currentQuestionIndex < _questions.length - 1
                ? (l10n?.next ?? 'Далее')
                : (l10n?.finish ?? 'Завершить'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n?.question('1', '1') ?? 'Вопрос')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null || _questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n?.question('1', '1') ?? 'Вопрос'),
        ),
        body: Center(
          child: _ErrorView(
            error: _error,
            onRetry: _loadQuestions,
          ),
        ),
      );
    }

    final question = _questions[_currentQuestionIndex];
    final questionNumber = _currentQuestionIndex + 1;
    final totalQuestions = _questions.length;

    return Scaffold(
      appBar: _buildAppBar(l10n, questionNumber, totalQuestions),
      body: _buildBody(question, l10n),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String? error;
  final VoidCallback onRetry;

  const _ErrorView({
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          error ?? (l10n?.questions_not_found ?? 'Вопросы не найдены'),
          style: const TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () async {
            if (error?.contains('Rate limit') == true ||
                error?.contains('429') == true) {
              // Ждем 10 секунд перед повтором при rate limit
              await Future<void>.delayed(const Duration(seconds: 10));
            }
            onRetry();
          },
          child: Text(
            (error?.contains('Rate limit') == true ||
                    error?.contains('429') == true)
                ? 'Повторить через 10 сек'
                : (l10n?.retry ?? 'Повторить'),
          ),
        ),
      ],
    );
  }
}
