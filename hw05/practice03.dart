import 'dart:async';

void main() async {
  await startCountDown(5);
  await startCountDown(0);
  await startCountDown(3);
}

Stream<int> countDown(int n) async* {
  if (n < 1) {
    throw ArgumentError('n должно быть >= 1, получено $n');
  }

  for (int i = n; i >= 1; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

Future<void> startCountDown(int n) async {
  print('Начинаем обратный отсчет от $n...');
  
  try {
    Stream<int> countdownStream = countDown(n);
    
    await for (int value in countdownStream) {
      print('Таймер: $value');
    }
    
    print('Обратный отсчет завершен!');
  } on ArgumentError catch (e) {
    print('Ошибка: ${e.message}');
  } catch (e) {
    print('Неизвестная ошибка: $e');
  }
}