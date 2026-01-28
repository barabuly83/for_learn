// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class SRu extends S {
  SRu([String locale = 'ru']) : super(locale);

  @override
  String get authorization => 'Авторизация';

  @override
  String get email => 'Почта';

  @override
  String get register => 'Зарегистрироваться';

  @override
  String get login => 'Войти';

  @override
  String get cannot_be_empty => 'Значение не может быть пустым';

  @override
  String get password => 'Пароль';

  @override
  String get back => 'Назад';

  @override
  String get main => 'Главная';

  @override
  String get start => 'Начать';

  @override
  String get logout => 'Выйти';

  @override
  String get profile => 'Профиль';

  @override
  String get select_category => 'Выберите категорию';

  @override
  String question(String firstValue, String secondValue) {
    return 'Вопрос $firstValue/$secondValue';
  }

  @override
  String get results => 'Результаты';

  @override
  String get go_back => 'Вернуться назад';

  @override
  String count_correct_answers(String value) {
    return 'Количество верных ответов: $value';
  }

  @override
  String category(String value) {
    return 'Категория: $value';
  }

  @override
  String get refresh => 'Обновить';

  @override
  String get user_info => 'Информация о пользователе';

  @override
  String get uid => 'Идентификатор пользователя';

  @override
  String get name => 'Имя';

  @override
  String get phone => 'Телефон';

  @override
  String get not_specified => 'Не указано';

  @override
  String get error_loading_categories => 'Ошибка загрузки категорий';

  @override
  String get categories_not_found => 'Категории не найдены';

  @override
  String get retry => 'Повторить';

  @override
  String get logout_error => 'Ошибка выхода';

  @override
  String get user_not_authorized => 'Пользователь не авторизован';

  @override
  String logout_error_message(String error) {
    return 'Ошибка при выходе: $error';
  }

  @override
  String get storage_testing => 'Тестирование Storage';

  @override
  String get upload_test => 'Загрузить тест';

  @override
  String get check_files => 'Проверить файлы';

  @override
  String get upload_image => 'Загрузить изображение';

  @override
  String file_uploaded(String url) {
    return 'Файл загружен! URL: $url';
  }

  @override
  String upload_error(String error) {
    return 'Ошибка загрузки: $error';
  }

  @override
  String last_file(String filename) {
    return 'Последний файл: $filename';
  }

  @override
  String get files_not_found => 'Файлы не найдены';

  @override
  String error(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get image_uploaded => 'Изображение загружено!';

  @override
  String image_upload_error(String error) {
    return 'Ошибка загрузки изображения: $error';
  }

  @override
  String get category_not_specified => 'Категория не указана';

  @override
  String get questions_not_found => 'Вопросы не найдены';

  @override
  String get next => 'Далее';

  @override
  String get finish => 'Завершить';

  @override
  String get login_with_google => 'Войти через Google';

  @override
  String get register_with_google => 'Регистрация через Google';

  @override
  String get confirm_password => 'Подтвердите пароль';

  @override
  String get password_min_length =>
      'Пароль должен содержать минимум 6 символов';

  @override
  String get passwords_do_not_match => 'Пароли не совпадают';

  @override
  String get quiz_history => 'История викторин';

  @override
  String get no_quiz_history => 'История викторин пуста';

  @override
  String get no_quiz_history_desc =>
      'Пройдите свою первую викторину, чтобы увидеть результаты здесь';

  @override
  String get select_difficulty => 'Выберите сложность';

  @override
  String get all_difficulties => 'Все сложности';

  @override
  String get all_difficulties_desc => 'Показать вопросы всех уровней сложности';

  @override
  String get easy_questions => 'Простые вопросы';

  @override
  String get medium_questions => 'Вопросы средней сложности';

  @override
  String get hard_questions => 'Сложные вопросы';

  @override
  String get cancel => 'Отмена';

  @override
  String get pageNotFound => 'Страница не найдена';

  @override
  String get pageNotFoundDescription =>
      'Страница, которую вы ищете, не существует.';

  @override
  String get goHome => 'На главную';

  @override
  String no_questions_found(String category, String difficulty) {
    return 'Вопросы для категории \'$category\' со сложностью \'$difficulty\' не найдены';
  }
}
