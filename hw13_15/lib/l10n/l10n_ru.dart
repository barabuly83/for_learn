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
}
