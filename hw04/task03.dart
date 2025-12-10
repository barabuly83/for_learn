void main() {
  print('=' * 50);
  print('ДОМАШНЯЯ РАБОТА 3: List<int?> с null значениями');
  print('=' * 50);
  
  // 1. Создаем список, который может содержать целые числа и null
  List<int?> numbers = [10, null, 20, null, 30, 40, null, 50, null, 60];
  
  print('Исходный список: $numbers');
  
  // 2. Проходим по списку и заменяем null на 0
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] == null) {
      numbers[i] = 0;
    }
  }
  
  print('Список после замены null на 0: $numbers');
  
  // 3. Используем оператор ?? для более компактной записи
  print('\n--- Дополнительные примеры ---');
  
  List<int?> anotherList = [1, null, 3, null, 5];
  print('Другой список до обработки: $anotherList');
  
  // Компактный способ с использованием оператора ??
  List<int?> processed = anotherList.map((n) => n ?? 0).toList();
  print('После обработки (оператор ??): $processed');
  
  // 4. Статистика
  print('\n--- Статистика ---');
  int nullCount = numbers.where((n) => n == 0).length;
  print('Количество нулей в финальном списке: $nullCount');
}