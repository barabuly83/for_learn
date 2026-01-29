// Файл для тестирования правил линтера
import 'package:flutter/material.dart';

// Нарушение camel_case_types - должно быть PascalCase
class TestClass {
  // Нарушение prefer_final_fields
  var nonFinalField = 1;

  // Нарушение prefer_const_constructors
  TestClass();

  // Нарушение avoid_print
  void testMethod() {
    print('test'); // Это должно быть предупреждением
  }
}

// Нарушение prefer_const_constructors
class AnotherClass extends StatelessWidget {
  const AnotherClass({super.key}); // Теперь const

  @override
  Widget build(BuildContext context) {
    return Container(); // Нарушение sized_box_for_whitespace
  }
}
