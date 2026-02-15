import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Todo App'**
  String get appTitle;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Register button text
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Name field label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Confirm password field label
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Logout button text
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Tasks page title
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get todos;

  /// Add task button text
  ///
  /// In en, this message translates to:
  /// **'Add Task'**
  String get addTodo;

  /// Task title field label
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// Task description field label
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Save button text
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Cancel button text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Delete button text
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Mark task as complete button text
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// Mark task as incomplete button text
  ///
  /// In en, this message translates to:
  /// **'Incomplete'**
  String get incomplete;

  /// Message when no tasks exist
  ///
  /// In en, this message translates to:
  /// **'No tasks yet'**
  String get noTodos;

  /// Encouragement to add first task
  ///
  /// In en, this message translates to:
  /// **'Add your first task!'**
  String get addFirstTodo;

  /// Login required message
  ///
  /// In en, this message translates to:
  /// **'Login Required'**
  String get loginRequired;

  /// Please login message
  ///
  /// In en, this message translates to:
  /// **'Please log in to view your tasks'**
  String get pleaseLogin;

  /// Error title
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Loading message
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Retry button text
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Welcome message on login screen
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// Subtitle on login screen
  ///
  /// In en, this message translates to:
  /// **'Log in to your account'**
  String get loginToAccount;

  /// Home page title
  ///
  /// In en, this message translates to:
  /// **'My Tasks'**
  String get myTasks;

  /// Loading tasks message
  ///
  /// In en, this message translates to:
  /// **'Loading tasks...'**
  String get loadingTasks;

  /// Forgot password link text
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// Password recovery dialog title
  ///
  /// In en, this message translates to:
  /// **'Password Recovery'**
  String get passwordRecovery;

  /// Send button text
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// Already have account text
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// Don't have account text
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// Profile page title
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Change password button text
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// Password changed success message
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get passwordChanged;

  /// Avatar updated success message
  ///
  /// In en, this message translates to:
  /// **'Avatar updated successfully'**
  String get avatarUpdated;

  /// Select from gallery option
  ///
  /// In en, this message translates to:
  /// **'Select from Gallery'**
  String get selectFromGallery;

  /// Take photo option
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// Image selection error message prefix
  ///
  /// In en, this message translates to:
  /// **'Image selection error'**
  String get imageSelectionError;

  /// Photo capture error message prefix
  ///
  /// In en, this message translates to:
  /// **'Photo capture error'**
  String get photoCaptureError;

  /// Avatar upload error message
  ///
  /// In en, this message translates to:
  /// **'Avatar upload error'**
  String get avatarUploadError;

  /// Logout confirmation dialog title
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutConfirm;

  /// Logout confirmation dialog message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirmMessage;

  /// Yes button text
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No button text
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// Edit task page title
  ///
  /// In en, this message translates to:
  /// **'Edit Task'**
  String get editTask;

  /// Update task button text
  ///
  /// In en, this message translates to:
  /// **'Update Task'**
  String get updateTask;

  /// Task updated success message
  ///
  /// In en, this message translates to:
  /// **'Task updated successfully'**
  String get taskUpdated;

  /// Task created success message
  ///
  /// In en, this message translates to:
  /// **'Task created successfully'**
  String get taskCreated;

  /// Task creation error message prefix
  ///
  /// In en, this message translates to:
  /// **'Task creation error'**
  String get taskCreationError;

  /// Task update error message prefix
  ///
  /// In en, this message translates to:
  /// **'Task update error'**
  String get taskUpdateError;

  /// Password reset success message
  ///
  /// In en, this message translates to:
  /// **'Password reset email sent to your email'**
  String get passwordResetSent;

  /// Authentication error: user not found
  ///
  /// In en, this message translates to:
  /// **'User with this email not found'**
  String get authErrorUserNotFound;

  /// Authentication error: wrong password
  ///
  /// In en, this message translates to:
  /// **'Invalid password'**
  String get authErrorWrongPassword;

  /// Authentication error: email already in use
  ///
  /// In en, this message translates to:
  /// **'User with this email already exists'**
  String get authErrorEmailAlreadyInUse;

  /// Authentication error: weak password
  ///
  /// In en, this message translates to:
  /// **'Password is too weak'**
  String get authErrorWeakPassword;

  /// Authentication error: invalid email
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get authErrorInvalidEmail;

  /// Authentication error: user disabled
  ///
  /// In en, this message translates to:
  /// **'Account is disabled'**
  String get authErrorUserDisabled;

  /// Authentication error: too many requests
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Please try again later'**
  String get authErrorTooManyRequests;

  /// Authentication error: operation not allowed
  ///
  /// In en, this message translates to:
  /// **'Operation not allowed'**
  String get authErrorOperationNotAllowed;

  /// Authentication error: requires recent login
  ///
  /// In en, this message translates to:
  /// **'Please log in again to perform this action'**
  String get authErrorRequiresRecentLogin;

  /// Generic authentication error
  ///
  /// In en, this message translates to:
  /// **'Authentication error'**
  String get authErrorUnknown;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
