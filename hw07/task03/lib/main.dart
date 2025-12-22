import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ==================== КЛАСС ДАННЫХ ====================
class CounterData {
  final int count;
  final VoidCallback increment;

  CounterData({required this.count, required this.increment});
}

// ==================== INHERITED WIDGET ====================
class CounterInheritedWidget extends InheritedWidget {
  final CounterData data;

  const CounterInheritedWidget({
    super.key,
    required super.child,
    required this.data,
  });

  static CounterData of(BuildContext context) {
    final inherited = context
        .dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();

    assert(inherited != null, 'CounterInheritedWidget not found in context');
    return inherited!.data;
  }

  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) {
    return data.count != oldWidget.data.count;
  }
}

// ==================== ПРОСТАВЩИК ДАННЫХ ====================
class CounterProvider extends StatefulWidget {
  final Widget child;

  const CounterProvider({super.key, required this.child});

  @override
  State<CounterProvider> createState() => _CounterProviderState();
}

class _CounterProviderState extends State<CounterProvider> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterInheritedWidget(
      data: CounterData(count: _counter, increment: _incrementCounter),
      child: widget.child,
    );
  }
}

// ==================== ВИДЖЕТ ОТОБРАЖЕНИЯ ====================
class DisplayCounter extends StatelessWidget {
  const DisplayCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final counterData = CounterInheritedWidget.of(context);

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Текущее значение счетчика:',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              '${counterData.count}',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== ВИДЖЕТ КНОПКИ ====================
class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    final counterData = CounterInheritedWidget.of(context);

    return ElevatedButton(
      onPressed: counterData.increment,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      ),
      child: const Text(
        'Увеличить счетчик на 1',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

// ==================== ГЛАВНОЕ ПРИЛОЖЕНИЕ ====================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InheritedWidget Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Пример InheritedWidget')),
      body: CounterProvider(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Демонстрация работы InheritedWidget',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // Виджет, который ОТОБРАЖАЕТ значение
              const DisplayCounter(),
              const SizedBox(height: 30),

              // Виджет, который ИЗМЕНЯЕТ значение
              const IncrementButton(),
              const SizedBox(height: 40),

              // Информация о работе приложения
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Как это работает:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '1. CounterProvider хранит состояние (счетчик)\n'
                      '2. CounterInheritedWidget распространяет данные\n'
                      '3. DisplayCounter показывает значение\n'
                      '4. IncrementButton изменяет значение',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
