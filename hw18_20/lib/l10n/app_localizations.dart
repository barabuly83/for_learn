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

  /// Delete avatar option
  ///
  /// In en, this message translates to:
  /// **'Delete Avatar'**
  String get deleteAvatar;

  /// Avatar deleted success message
  ///
  /// In en, this message translates to:
  /// **'Avatar deleted successfully'**
  String get avatarDeleted;

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

  /// Actions section title
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// Logout from account button text
  ///
  /// In en, this message translates to:
  /// **'Logout from account'**
  String get logoutFromAccount;

  /// User ID field label
  ///
  /// In en, this message translates to:
  /// **'User ID'**
  String get userId;

  /// Text for unspecified values
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get notSpecified;

  /// Current password field label
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get currentPassword;

  /// Current password validation message
  ///
  /// In en, this message translates to:
  /// **'Enter current password'**
  String get enterCurrentPassword;

  /// New password field label
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// New password validation message
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get enterNewPassword;

  /// Confirm new password field label
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get confirmNewPassword;

  /// Passwords mismatch error message
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// Password length validation message
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLength;

  /// Avatar saved success message
  ///
  /// In en, this message translates to:
  /// **'Avatar saved successfully'**
  String get avatarSavedSuccessfully;

  /// Avatar save error message prefix
  ///
  /// In en, this message translates to:
  /// **'Avatar save error'**
  String get avatarSaveError;

  /// Avatar delete error message prefix
  ///
  /// In en, this message translates to:
  /// **'Avatar delete error'**
  String get avatarDeleteError;

  /// Registration page title
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount;

  /// Registration page subtitle
  ///
  /// In en, this message translates to:
  /// **'Fill out the registration form'**
  String get fillRegistrationForm;

  /// Name field hint
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterYourName;

  /// Name field validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter name'**
  String get pleaseEnterName;

  /// Name length validation message
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 2 characters'**
  String get nameMinLength;

  /// Email field validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter email'**
  String get pleaseEnterEmail;

  /// Email format validation message
  ///
  /// In en, this message translates to:
  /// **'Enter valid email'**
  String get enterValidEmail;

  /// Password field hint
  ///
  /// In en, this message translates to:
  /// **'Minimum 6 characters'**
  String get minimum6Characters;

  /// Password field validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter password'**
  String get pleaseEnterPassword;

  /// Confirm password field hint
  ///
  /// In en, this message translates to:
  /// **'Repeat password'**
  String get repeatPassword;

  /// Confirm password field validation message
  ///
  /// In en, this message translates to:
  /// **'Please confirm password'**
  String get pleaseConfirmPassword;

  /// Register button text
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerButton;

  /// Password field hint
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get enterPassword;

  /// Password length validation message
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least 6 characters'**
  String get passwordMin6Characters;

  /// Login error button text
  ///
  /// In en, this message translates to:
  /// **'Login error'**
  String get loginError;

  /// Login error message
  ///
  /// In en, this message translates to:
  /// **'Check email and password'**
  String get checkEmailAndPassword;

  /// Password reset dialog message
  ///
  /// In en, this message translates to:
  /// **'Enter your email address. We will send you an email with password recovery instructions.'**
  String get enterEmailForPasswordReset;

  /// Task title field label
  ///
  /// In en, this message translates to:
  /// **'Task title'**
  String get taskTitle;

  /// Task title field validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter task title'**
  String get pleaseEnterTaskTitle;

  /// Task description field label
  ///
  /// In en, this message translates to:
  /// **'Task description'**
  String get taskDescription;

  /// Task description field validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter task description'**
  String get pleaseEnterTaskDescription;

  /// Error messages prefix
  ///
  /// In en, this message translates to:
  /// **'Error: '**
  String get errorPrefix;

  /// Error message: user is not authenticated
  ///
  /// In en, this message translates to:
  /// **'User must be authenticated'**
  String get userMustBeAuthenticated;

  /// Error message for failed task loading
  ///
  /// In en, this message translates to:
  /// **'Failed to load tasks'**
  String get failedToLoadTodos;
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
