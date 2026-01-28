// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get authorization => 'Authorization';

  @override
  String get email => 'Email';

  @override
  String get register => 'Register';

  @override
  String get login => 'Login';

  @override
  String get cannot_be_empty => 'Value cannot be empty';

  @override
  String get password => 'Password';

  @override
  String get back => 'Back';

  @override
  String get main => 'Main';

  @override
  String get start => 'Start';

  @override
  String get logout => 'Logout';

  @override
  String get profile => 'Profile';

  @override
  String get select_category => 'Select Category';

  @override
  String question(String firstValue, String secondValue) {
    return 'Question $firstValue/$secondValue';
  }

  @override
  String get results => 'Results';

  @override
  String get go_back => 'Go Back';

  @override
  String count_correct_answers(String value) {
    return 'Correct answers: $value';
  }

  @override
  String category(String value) {
    return 'Category: $value';
  }

  @override
  String get refresh => 'Refresh';

  @override
  String get user_info => 'User Information';

  @override
  String get uid => 'User ID';

  @override
  String get name => 'Name';

  @override
  String get phone => 'Phone';

  @override
  String get not_specified => 'Not specified';

  @override
  String get error_loading_categories => 'Error loading categories';

  @override
  String get categories_not_found => 'Categories not found';

  @override
  String get retry => 'Retry';

  @override
  String get logout_error => 'Logout error';

  @override
  String get user_not_authorized => 'User not authorized';

  @override
  String logout_error_message(String error) {
    return 'Logout error: $error';
  }

  @override
  String get storage_testing => 'Storage Testing';

  @override
  String get upload_test => 'Upload Test';

  @override
  String get check_files => 'Check Files';

  @override
  String get upload_image => 'Upload Image';

  @override
  String file_uploaded(String url) {
    return 'File uploaded! URL: $url';
  }

  @override
  String upload_error(String error) {
    return 'Upload error: $error';
  }

  @override
  String last_file(String filename) {
    return 'Last file: $filename';
  }

  @override
  String get files_not_found => 'Files not found';

  @override
  String error(String error) {
    return 'Error: $error';
  }

  @override
  String get image_uploaded => 'Image uploaded!';

  @override
  String image_upload_error(String error) {
    return 'Image upload error: $error';
  }

  @override
  String get category_not_specified => 'Category not specified';

  @override
  String get questions_not_found => 'Questions not found';

  @override
  String get next => 'Next';

  @override
  String get finish => 'Finish';

  @override
  String get login_with_google => 'Sign in with Google';

  @override
  String get register_with_google => 'Sign up with Google';

  @override
  String get confirm_password => 'Confirm Password';

  @override
  String get password_min_length => 'Password must be at least 6 characters';

  @override
  String get passwords_do_not_match => 'Passwords do not match';

  @override
  String get quiz_history => 'Quiz History';

  @override
  String get no_quiz_history => 'No Quiz History';

  @override
  String get no_quiz_history_desc => 'Take your first quiz to see results here';

  @override
  String get select_difficulty => 'Select Difficulty';

  @override
  String get all_difficulties => 'All Difficulties';

  @override
  String get all_difficulties_desc => 'Show questions of all difficulty levels';

  @override
  String get easy_questions => 'Easy questions';

  @override
  String get medium_questions => 'Medium difficulty questions';

  @override
  String get hard_questions => 'Hard questions';

  @override
  String get cancel => 'Cancel';

  @override
  String get pageNotFound => 'Page Not Found';

  @override
  String get pageNotFoundDescription =>
      'The page you\'re looking for doesn\'t exist.';

  @override
  String get goHome => 'Go Home';

  @override
  String no_questions_found(String category, String difficulty) {
    return 'No questions found for category \'$category\' with difficulty \'$difficulty\'';
  }
}
