import 'dart:async';

void main() async {
  // Часть 1: асинхронная функция fetchData
  print('Начинаем загрузку данных...');
  String data = await fetchData();
  print('Результат загрузки: $data');

  // Часть 2: поток с числами
  print('\n Запускаем поток чисел:');
  await streamExample();
}

// Асинхронная функция, имитирующая загрузку данных
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Данные успешно загружены!';
}

// Функция для работы с потоком
Future<void> streamExample() async {
  // Создаем поток с числами от 1 до 10 с интервалом 1 секунда
  Stream<int> numberStream = Stream.periodic(
    Duration(seconds: 1),
    (count) => count + 1,
  ).take(10);

  // Создаем Completer для отслеживания завершения потока
  final completer = Completer<void>();

  // Подписываемся на поток (одиночная подписка)
  StreamSubscription<int>? subscription;
  subscription = numberStream.listen(
    (number) {
      print('Получено число: $number');
    },
    onDone: () {
      print('Поток завершен');
      subscription?.cancel();
      completer.complete();
    },
    onError: (error) {
      print('Ошибка в потоке: $error');
      completer.complete();
    },
  );

  // Ждем завершения потока
  await completer.future;
}