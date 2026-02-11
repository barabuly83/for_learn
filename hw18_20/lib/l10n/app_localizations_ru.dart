// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Список задач';

  @override
  String get login => 'Войти';

  @override
  String get register => 'Регистрация';

  @override
  String get email => 'Email';

  @override
  String get password => 'Пароль';

  @override
  String get name => 'Имя';

  @override
  String get confirmPassword => 'Подтвердите пароль';

  @override
  String get logout => 'Выйти';

  @override
  String get todos => 'Задачи';

  @override
  String get addTodo => 'Добавить задачу';

  @override
  String get title => 'Заголовок';

  @override
  String get description => 'Описание';

  @override
  String get save => 'Сохранить';

  @override
  String get cancel => 'Отмена';

  @override
  String get delete => 'Удалить';

  @override
  String get complete => 'Выполнить';

  @override
  String get incomplete => 'Не выполнено';

  @override
  String get noTodos => 'Задач пока нет';

  @override
  String get addFirstTodo => 'Добавьте свою первую задачу!';

  @override
  String get loginRequired => 'Требуется вход';

  @override
  String get pleaseLogin =>
      'Пожалуйста, войдите, чтобы просмотреть свои задачи';

  @override
  String get error => 'Ошибка';

  @override
  String get loading => 'Загрузка...';

  @override
  String get retry => 'Повторить';
}
