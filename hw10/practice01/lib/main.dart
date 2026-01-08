import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Implicit Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ImplicitAnimationScreen(),
    );
  }
}

class ImplicitAnimationScreen extends StatefulWidget {
  const ImplicitAnimationScreen({super.key});

  @override
  State<ImplicitAnimationScreen> createState() => _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  // Состояние для управления анимацией
  bool _isExpanded = false;

  void _toggleAnimation() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Implicit Animation'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleAnimation,
          child: AnimatedContainer(
            // Ширина: 200 -> 300 и обратно
            width: _isExpanded ? 300 : 200,
            // Высота: 100 -> 150 и обратно
            height: _isExpanded ? 150 : 100,
            // Закругленные углы
            decoration: BoxDecoration(
              // Цвет: зеленый -> оранжевый и обратно
              color: _isExpanded ? Colors.orange : Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
            // Длительность анимации
            duration: const Duration(milliseconds: 500),
            // Кривая анимации для плавности
            curve: Curves.easeInOut,
            // Выравнивание содержимого
            alignment: Alignment.center,
            // Текст внутри карточки
            child: const Text(
              'НАЖМИ МЕНЯ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
