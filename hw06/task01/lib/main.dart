import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Домашнее задание',
      theme: ThemeData(
        fontFamily: 'MyCustomFont',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Демонстрация ресурсов'),
      ),
      body: Column(
        children: [
          // Spacer занимает все доступное пространство сверху
          const Spacer(),
          
          // Изображение центрируется по вертикали
          Container(
            width: screenWidth,
            height: screenWidth * 0.6,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Image.asset(
              'assets/images/archdiagram.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.error, color: Colors.red),
                );
              },
            ),
          ),
          
          // Spacer снизу перемещает текст к низу
          const Spacer(),
          
          // Текст внизу
          Column(
            children: [
              const Text(
                'Привет, Flutter!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Этот текст отображается кастомным шрифтом.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05), // Отступ снизу
            ],
          ),
        ],
      ),
    );
  }
}