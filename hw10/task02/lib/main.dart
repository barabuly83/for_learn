import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Position Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PositionAnimationScreen(),
    );
  }
}

class PositionAnimationScreen extends StatefulWidget {
  const PositionAnimationScreen({super.key});

  @override
  State<PositionAnimationScreen> createState() => _PositionAnimationScreenState();
}

class _PositionAnimationScreenState extends State<PositionAnimationScreen> {
  // Позиция круга: true - верхний левый угол, false - нижний правый угол
  bool _isTopLeft = true;

  void _togglePosition() {
    setState(() {
      _isTopLeft = !_isTopLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Анимация изменения положения'),
      ),
      body: GestureDetector(
        onTap: _togglePosition,
        behavior: HitTestBehavior.opaque,
        child: Stack(
          children: [
            AnimatedPositioned(
              // Диагональное перемещение: верхний левый -> нижний правый
              top: _isTopLeft ? 50 : null,
              left: _isTopLeft ? 50 : null,
              bottom: _isTopLeft ? null : 50,
              right: _isTopLeft ? null : 50,
              // Чуть более длинная и плавная анимация
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeInOutCubic,
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
