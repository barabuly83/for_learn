import 'dart:async';

class Counter {
  int _count = 0;
  final StreamController<int> _controller = StreamController<int>.broadcast();
  
  Stream<int> get stream => _controller.stream;
  
  void increment() {
    _count++;
    _controller.add(_count);
  }
  
  void decrement() {
    _count--;
    if (_count < 0) {
      _controller.addError(Exception('Счетчик не может быть отрицательным'));
      _controller.close();
      return;
    }
    _controller.add(_count);
  }
  
  void dispose() {
    _controller.close();
  }
}

void main() async {
  final counter = Counter();
  
  // Подписка на поток изменений счетчика
  final subscription = counter.stream.listen(
    (value) {
      print('Текущее значение счетчика: $value');
    },
    onError: (error) {
      print('Ошибка: $error');
    },
    onDone: () {
      print('Поток завершен');
    },
  );
  
  // Демонстрация работы счетчика
  print('Увеличиваем счетчик:');
  counter.increment(); // 1
  await Future.delayed(Duration(milliseconds: 500));
  counter.increment(); // 2
  await Future.delayed(Duration(milliseconds: 500));
  
  print('\n Уменьшаем счетчик:');
  counter.decrement(); // 1
  await Future.delayed(Duration(milliseconds: 500));
  counter.decrement(); // 0
  await Future.delayed(Duration(milliseconds: 500));
  
  print('\n Попытка уменьшить ниже нуля:');
  counter.decrement(); // Ошибка
  
  // Ждем завершения обработки
  await Future.delayed(Duration(seconds: 1));
  
  // Отменяем подписку
  subscription.cancel();
  counter.dispose();
}