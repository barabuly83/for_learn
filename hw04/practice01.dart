void main() {
  // Используем List для создания неизвестного для анализатора значения
  List<int?> numbers = [10, null];
  List<String?> texts = ["Hello", null];
  
  // Берем первое значение (10) - не null
  int? number = numbers[0];
  String? text = texts[0];
  
  print("=== Обработка значений ===");
  
  // 1. ?? - всегда работает
  print("1. Используем ?? : ${(number ?? 0) * 2}");
  
  // 2. ! - используем, когда анализ потока не может определить
  // Используем глобальную переменную или сложную логику
  processWithBang(number);
  
  // 3. ?. и ??
  print("3. Используем ?. и ?? : ${text?.length ?? "Текст не указан"}");
}

// Выносим в отдельную функцию, чтобы избежать type promotion
void processWithBang(int? num) {
  if (num != null) {
    // В отдельной функции type promotion тоже работает,
    // но давайте усложним:
    int? temp = someComplexLogic(num);
    print("2. Используем ! : ${temp! * 2}");
  } else {
    print("2. Число не указано");
  }
}

int? someComplexLogic(int? value) {
  // Какая-то сложная логика, которая может вернуть null
  return value;
}