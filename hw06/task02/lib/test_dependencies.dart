import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:json_annotation/json_annotation.dart';

// Выносим класс из функции на уровень модуля
@JsonSerializable()
class TestClass {
  final String test;

  TestClass(this.test);

  // Для работы json_serializable нужно добавить методы
  factory TestClass.fromJson(Map<String, dynamic> json) =>
      TestClass(json['test']);
  Map<String, dynamic> toJson() => {'test': test};
}

void testImports() {
  print('Все пакеты успешно импортированы!');

  // Тест http
  final client = http.Client();
  print('HTTP client создан');
  client.close(); // Закрываем клиент после использования

  // Тест path
  final testPath = path.join('dir', 'file.txt');
  print('Path создан: $testPath');

  // Тест json_annotation - теперь используем класс на уровне модуля
  final testClass = TestClass('test value');
  print('JsonSerializable аннотация работает: ${testClass.toJson()}');
}
