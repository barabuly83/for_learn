import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Практика: Виджеты',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Переменная для хранения текста из TextField
  String _userInput = '';
  // Контроллер для TextField
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    // Важно освободить контроллер при удалении виджета
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Практика с виджетами'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Текст с инструкцией
              const Text(
                'Демонстрация виджетов Flutter',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 20),
              
              // Текст, отображающий введенные данные
              Text(
                _userInput.isEmpty ? 'Введите текст ниже' : 'Вы ввели: $_userInput',
                style: TextStyle(
                  fontSize: 18,
                  color: _userInput.isEmpty ? Colors.grey : Colors.green,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 30),
              
              // Поле для ввода текста
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Введите текст',
                  hintText: 'Напишите что-нибудь...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.edit),
                  filled: true,
                  fillColor: Colors.grey[50],
                ),
                onChanged: (value) {
                  setState(() {
                    _userInput = value;
                  });
                },
              ),
              
              const SizedBox(height: 20),
              
              // Первая кнопка - для сохранения текста
              ElevatedButton(
                onPressed: () {
                  if (_userInput.isNotEmpty) {
                    // Показываем диалоговое окно с подтверждением
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Текст сохранен'),
                        content: Text('Вы ввели: "$_userInput"'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Если поле пустое, показываем snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Пожалуйста, введите текст'),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Сохранить текст',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 15),
              
              // Вторая кнопка - для очистки поля
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _userInput = '';
                    _textController.clear();
                  });
                  // Показываем snackbar об очистке
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Поле очищено'),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.clear, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Очистить поле',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Разделитель
              const Divider(
                color: Colors.grey,
                thickness: 1,
                height: 20,
              ),
              
              // Информация об использованных виджетах
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Использованные виджеты:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              // Список использованных виджетов
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildWidgetItem('MaterialApp'),
                    _buildWidgetItem('Scaffold'),
                    _buildWidgetItem('Text'),
                    _buildWidgetItem('Column'),
                    _buildWidgetItem('ElevatedButton'),
                    _buildWidgetItem('TextField'),
                    _buildWidgetItem('Center'),
                    _buildWidgetItem('Padding'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Кнопка в правом нижнем углу
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Показываем информацию о приложении
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('О приложении'),
              content: const Text(
                'Это демонстрационное приложение, созданное для практики с основными виджетами Flutter.\n\nВсе виджеты из задания успешно использованы!',
                textAlign: TextAlign.justify,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Закрыть'),
                ),
              ],
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.info, color: Colors.white),
      ),
    );
  }

  // Вспомогательный метод для отображения виджетов в списке
  Widget _buildWidgetItem(String widgetName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 16),
          const SizedBox(width: 10),
          Text(
            widgetName,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}