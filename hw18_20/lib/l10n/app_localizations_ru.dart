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

  @override
  String get welcome => 'Добро пожаловать';

  @override
  String get loginToAccount => 'Войдите в свой аккаунт';

  @override
  String get myTasks => 'Мои дела';

  @override
  String get loadingTasks => 'Загрузка задач...';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get passwordRecovery => 'Восстановление пароля';

  @override
  String get send => 'Отправить';

  @override
  String get alreadyHaveAccount => 'Уже есть аккаунт?';

  @override
  String get dontHaveAccount => 'Нет аккаунта?';

  @override
  String get profile => 'Профиль';

  @override
  String get changePassword => 'Изменить пароль';

  @override
  String get passwordChanged => 'Пароль успешно изменен';

  @override
  String get avatarUpdated => 'Аватарка успешно обновлена';

  @override
  String get selectFromGallery => 'Выбрать из галереи';

  @override
  String get takePhoto => 'Сделать фото';

  @override
  String get imageSelectionError => 'Ошибка выбора изображения';

  @override
  String get photoCaptureError => 'Ошибка съемки фото';

  @override
  String get avatarUploadError => 'Ошибка загрузки аватарки';

  @override
  String get logoutConfirm => 'Выход из аккаунта';

  @override
  String get logoutConfirmMessage =>
      'Вы уверены, что хотите выйти из аккаунта?';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get editTask => 'Редактировать задачу';

  @override
  String get updateTask => 'Обновить задачу';

  @override
  String get taskUpdated => 'Задача обновлена успешно';

  @override
  String get taskCreated => 'Задача создана успешно';

  @override
  String get taskCreationError => 'Ошибка создания задачи';

  @override
  String get taskUpdateError => 'Ошибка обновления задачи';

  @override
  String get passwordResetSent =>
      'Письмо для восстановления пароля отправлено на ваш email';

  @override
  String get authErrorUserNotFound => 'Пользователь с таким email не найден';

  @override
  String get authErrorWrongPassword => 'Неверный пароль';

  @override
  String get authErrorEmailAlreadyInUse =>
      'Пользователь с таким email уже существует';

  @override
  String get authErrorWeakPassword => 'Пароль слишком слабый';

  @override
  String get authErrorInvalidEmail => 'Неверный формат email';

  @override
  String get authErrorUserDisabled => 'Аккаунт заблокирован';

  @override
  String get authErrorTooManyRequests =>
      'Слишком много попыток. Попробуйте позже';

  @override
  String get authErrorOperationNotAllowed => 'Операция не разрешена';

  @override
  String get authErrorRequiresRecentLogin =>
      'Пожалуйста, войдите снова для выполнения этого действия';

  @override
  String get authErrorUnknown => 'Ошибка аутентификации';
}
