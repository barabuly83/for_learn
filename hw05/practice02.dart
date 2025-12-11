void main() {
  print('Практика 2: Функции\n');
  
  // 1. Создаем функцию createMultiplier с явной типизацией
  // Указываем, что возвращаем функцию, принимающую int и возвращающую int
  int Function(int) createMultiplier(int n) {
    // Возвращаем анонимную функцию (замыкание)
    return (int x) {
      return x * n;
    };
  }
  
  // 2. Создаем функции doubleIt и tripleIt с явным типом
  print('Создание функций-умножителей:');
  final int Function(int) doubleIt = createMultiplier(2);
  final int Function(int) tripleIt = createMultiplier(3);
  
  // Тестируем созданные функции
  print('doubleIt(5) = ${doubleIt(5)}');  // 10
  print('tripleIt(5) = ${tripleIt(5)}');  // 15
  
  // 3. Создаем список чисел от 1 до 5
  print('\n Создание списка чисел:');
  List<int> numbers = [1, 2, 3, 4, 5];
  print('numbers = $numbers');
  
  // 4. Применяем функции к каждому элементу списка
  print('\n Применение функций к списку:');
  
  // Используем метод map для преобразования каждого элемента
  // Явно указываем тип преобразования в map
  List<int> doubledNumbers = numbers.map((int x) => doubleIt(x)).toList();
  List<int> tripledNumbers = numbers.map((int x) => tripleIt(x)).toList();
  
  print('Числа, умноженные на 2: $doubledNumbers');
  print('Числа, умноженные на 3: $tripledNumbers');
  
  // 5. Более компактный вариант с анонимными функциями
  print('\n Компактный вариант:');
  
  List<int> doubledCompact = numbers.map((x) => x * 2).toList();
  List<int> tripledCompact = numbers.map((x) => x * 3).toList();
  
  print('Удвоенные (компактно): $doubledCompact');
  print('Утроенные (компактно): $tripledCompact');
}