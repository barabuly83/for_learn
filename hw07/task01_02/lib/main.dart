import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Объединенное приложение',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MainScreen(),
    );
  }
}

// ==================== ЗАДАНИЕ 1: StatelessWidget ====================
class StaticTextWidget extends StatelessWidget {
  final String text;

  const StaticTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// ==================== ЗАДАНИЕ 1: StatefulWidget счетчика ====================
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Счетчик',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(
              '$_counter',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              child: const Text(
                'Увеличить счетчик',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== ЗАДАНИЕ 2: Главный экран ====================
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _mainText = 'Привет, Flutter!';

  void _changeText() {
    setState(() {
      _mainText = 'Вы нажали кнопку!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar (используется в обоих заданиях)
      appBar: AppBar(
        title: const Text('Моё первое приложение'),
        backgroundColor: Colors.blue,
      ),

      // Тело приложения
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Задание 1: StatelessWidget с текстом
            const StaticTextWidget(
              text: 'Этот текст никогда не меняется (StatelessWidget)',
            ),

            // Задание 2: Текст, который изменяется при нажатии кнопки
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Text(
                _mainText,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Задание 2: Кнопка для изменения текста
            ElevatedButton(
              onPressed: _changeText,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 16,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Нажми меня'),
            ),

            // Разделитель между заданиями
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 30,
                endIndent: 30,
              ),
            ),

            // Задание 1: StatefulWidget счетчик
            const CounterWidget(),
          ],
        ),
      ),

      // FloatingActionButton (Задание 1)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Выводим сообщение в консоль
          print('Кнопка нажата!');
          // Также показываем snackbar для визуальной обратной связи
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Сообщение "Кнопка нажата!" выведено в консоль'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add_comment, color: Colors.white),
      ),

      // Располагаем FAB в удобном месте
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
