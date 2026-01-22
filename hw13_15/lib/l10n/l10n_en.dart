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
}
