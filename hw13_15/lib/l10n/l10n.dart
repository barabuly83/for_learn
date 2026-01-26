import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// Заголовок страницы авторизации
  ///
  /// In ru, this message translates to:
  /// **'Авторизация'**
  String get authorization;

  /// Поле ввода email
  ///
  /// In ru, this message translates to:
  /// **'Почта'**
  String get email;

  /// Кнопка регистрации
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрироваться'**
  String get register;

  /// Кнопка входа
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get login;

  /// Сообщение об ошибке валидации
  ///
  /// In ru, this message translates to:
  /// **'Значение не может быть пустым'**
  String get cannot_be_empty;

  /// Поле ввода пароля
  ///
  /// In ru, this message translates to:
  /// **'Пароль'**
  String get password;

  /// Кнопка назад
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get back;

  /// Заголовок главной страницы
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get main;

  /// Кнопка начала викторины
  ///
  /// In ru, this message translates to:
  /// **'Начать'**
  String get start;

  /// Кнопка выхода
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get logout;

  /// Заголовок страницы профиля
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profile;

  /// Заголовок страницы выбора категории
  ///
  /// In ru, this message translates to:
  /// **'Выберите категорию'**
  String get select_category;

  /// Заголовок вопроса с номером
  ///
  /// In ru, this message translates to:
  /// **'Вопрос {firstValue}/{secondValue}'**
  String question(String firstValue, String secondValue);

  /// Заголовок страницы результатов
  ///
  /// In ru, this message translates to:
  /// **'Результаты'**
  String get results;

  /// Кнопка возврата назад
  ///
  /// In ru, this message translates to:
  /// **'Вернуться назад'**
  String get go_back;

  /// Текст с количеством правильных ответов
  ///
  /// In ru, this message translates to:
  /// **'Количество верных ответов: {value}'**
  String count_correct_answers(String value);

  /// Текст с названием категории
  ///
  /// In ru, this message translates to:
  /// **'Категория: {value}'**
  String category(String value);

  /// Кнопка обновления
  ///
  /// In ru, this message translates to:
  /// **'Обновить'**
  String get refresh;

  /// Заголовок раздела информации о пользователе
  ///
  /// In ru, this message translates to:
  /// **'Информация о пользователе'**
  String get user_info;

  /// Метка идентификатора пользователя
  ///
  /// In ru, this message translates to:
  /// **'Идентификатор пользователя'**
  String get uid;

  /// Метка имени
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get name;

  /// Метка телефона
  ///
  /// In ru, this message translates to:
  /// **'Телефон'**
  String get phone;

  /// Значение не указано
  ///
  /// In ru, this message translates to:
  /// **'Не указано'**
  String get not_specified;

  /// Сообщение об ошибке при загрузке категорий
  ///
  /// In ru, this message translates to:
  /// **'Ошибка загрузки категорий'**
  String get error_loading_categories;

  /// Сообщение когда категории недоступны
  ///
  /// In ru, this message translates to:
  /// **'Категории не найдены'**
  String get categories_not_found;

  /// Кнопка повтора
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get retry;

  /// Сообщение об ошибке при выходе
  ///
  /// In ru, this message translates to:
  /// **'Ошибка выхода'**
  String get logout_error;

  /// Сообщение когда пользователь не авторизован
  ///
  /// In ru, this message translates to:
  /// **'Пользователь не авторизован'**
  String get user_not_authorized;

  /// Сообщение об ошибке при выходе с деталями
  ///
  /// In ru, this message translates to:
  /// **'Ошибка при выходе: {error}'**
  String logout_error_message(String error);

  /// Заголовок раздела тестирования Storage
  ///
  /// In ru, this message translates to:
  /// **'Тестирование Storage'**
  String get storage_testing;

  /// Кнопка загрузки тестового файла
  ///
  /// In ru, this message translates to:
  /// **'Загрузить тест'**
  String get upload_test;

  /// Кнопка проверки файлов
  ///
  /// In ru, this message translates to:
  /// **'Проверить файлы'**
  String get check_files;

  /// Кнопка загрузки изображения
  ///
  /// In ru, this message translates to:
  /// **'Загрузить изображение'**
  String get upload_image;

  /// Сообщение об успешной загрузке файла
  ///
  /// In ru, this message translates to:
  /// **'Файл загружен! URL: {url}'**
  String file_uploaded(String url);

  /// Сообщение об ошибке загрузки
  ///
  /// In ru, this message translates to:
  /// **'Ошибка загрузки: {error}'**
  String upload_error(String error);

  /// Сообщение о последнем файле
  ///
  /// In ru, this message translates to:
  /// **'Последний файл: {filename}'**
  String last_file(String filename);

  /// Сообщение когда файлы не найдены
  ///
  /// In ru, this message translates to:
  /// **'Файлы не найдены'**
  String get files_not_found;

  /// Общее сообщение об ошибке
  ///
  /// In ru, this message translates to:
  /// **'Ошибка: {error}'**
  String error(String error);

  /// Сообщение об успешной загрузке изображения
  ///
  /// In ru, this message translates to:
  /// **'Изображение загружено!'**
  String get image_uploaded;

  /// Сообщение об ошибке загрузки изображения
  ///
  /// In ru, this message translates to:
  /// **'Ошибка загрузки изображения: {error}'**
  String image_upload_error(String error);

  /// Сообщение когда категория не указана
  ///
  /// In ru, this message translates to:
  /// **'Категория не указана'**
  String get category_not_specified;

  /// Сообщение когда вопросы не найдены
  ///
  /// In ru, this message translates to:
  /// **'Вопросы не найдены'**
  String get questions_not_found;

  /// Кнопка перехода к следующему вопросу
  ///
  /// In ru, this message translates to:
  /// **'Далее'**
  String get next;

  /// Кнопка завершения викторины
  ///
  /// In ru, this message translates to:
  /// **'Завершить'**
  String get finish;

  /// Кнопка входа через Google
  ///
  /// In ru, this message translates to:
  /// **'Войти через Google'**
  String get login_with_google;

  /// Кнопка регистрации через Google
  ///
  /// In ru, this message translates to:
  /// **'Регистрация через Google'**
  String get register_with_google;

  /// Поле подтверждения пароля
  ///
  /// In ru, this message translates to:
  /// **'Подтвердите пароль'**
  String get confirm_password;

  /// Сообщение об ошибке валидации пароля
  ///
  /// In ru, this message translates to:
  /// **'Пароль должен содержать минимум 6 символов'**
  String get password_min_length;

  /// Сообщение когда пароли не совпадают
  ///
  /// In ru, this message translates to:
  /// **'Пароли не совпадают'**
  String get passwords_do_not_match;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return SEn();
    case 'ru':
      return SRu();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
