import 'dart:io';

void main() {
  print('=== КАЛЬКУЛЯТОР ===');
  
  try {
    // Получаем первое число
    stdout.write('Введите первое число: ');
    String? input1 = stdin.readLineSync();
    double number1 = double.parse(input1 ?? '0');
    
    // Получаем второе число
    stdout.write('Введите второе число: ');
    String? input2 = stdin.readLineSync();
    double number2 = double.parse(input2 ?? '0');
    
    // Выводим результаты
    print('\n=== РЕЗУЛЬТАТЫ ===');
    
    // 1. Сложение
    double sum = number1 + number2;
    print('1. Сложение: $number1 + $number2 = $sum');
    
    // 2. Вычитание
    double difference = number1 - number2;
    print('2. Вычитание: $number1 - $number2 = $difference');
    
    // 3. Умножение
    double product = number1 * number2;
    print('3. Умножение: $number1 * $number2 = $product');
    
    // 4. Деление (с проверкой деления на ноль)
    if (number2 != 0) {
      double quotient = number1 / number2;
      print('4. Деление: $number1 / $number2 = $quotient');
    } else {
      print('4. Деление: $number1 / $number2 = Невозможно (деление на ноль)');
    }
    
    // 5. Проверка, какое число больше
    print('\n=== СРАВНЕНИЕ ===');
    if (number1 > number2) {
      print('$number1 > $number2 (первое число больше второго)');
    } else if (number1 < number2) {
      print('$number1 < $number2 (первое число меньше второго)');
    } else {
      print('$number1 = $number2 (числа равны)');
    }
    
  } catch (e) {
    print('ОШИБКА: Пожалуйста, введите корректные числа!');
    print('Пример: 10, 3.14, -5, 0');
  }
}