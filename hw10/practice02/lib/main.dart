import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explicit Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExplicitAnimationScreen(),
    );
  }
}

class ExplicitAnimationScreen extends StatefulWidget {
  const ExplicitAnimationScreen({super.key});

  @override
  State<ExplicitAnimationScreen> createState() => _ExplicitAnimationScreenState();
}

class _ExplicitAnimationScreenState extends State<ExplicitAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Создаем AnimationController с длительностью 1.5 секунды
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Tween для вращения: от 0 до 1 оборота (360 градусов)
    // RotationTransition.turns использует значения в оборотах (1.0 = 360°)
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Tween для масштабирования: от 1.0 до 2.0 и обратно
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    // Важно освободить контроллер при удалении виджета
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    // Запускаем анимацию вперед
    _controller.forward();
  }

  void _resetAnimation() {
    // Сбрасываем анимацию в начальное состояние
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Explicit Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Комбинируем RotationTransition и ScaleTransition
            RotationTransition(
              turns: _rotationAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: const Icon(
                  Icons.star,
                  size: 100,
                  color: Colors.amber,
                ),
              ),
            ),
            // Отступ между иконкой и кнопками
            const SizedBox(height: 60),
            // Кнопки управления анимацией
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Кнопка "Запустить"
                ElevatedButton(
                  onPressed: _startAnimation,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: const Text('Запустить'),
                ),
                const SizedBox(width: 16),
                // Кнопка "Сбросить"
                ElevatedButton(
                  onPressed: _resetAnimation,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: const Text('Сбросить'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
