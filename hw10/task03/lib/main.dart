import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fade Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FadeAnimationScreen(),
    );
  }
}

class FadeAnimationScreen extends StatefulWidget {
  const FadeAnimationScreen({super.key});

  @override
  State<FadeAnimationScreen> createState() => _FadeAnimationScreenState();
}

class _FadeAnimationScreenState extends State<FadeAnimationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    // Создаем AnimationController с длительностью 1.5 секунды
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Tween для изменения прозрачности: от 0.0 (полностью прозрачный) до 1.0 (полностью видимый)
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    // Важно освободить контроллер при удалении виджета
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    // Запускаем анимацию с повторением (вперед и назад)
    _controller.repeat(reverse: true);
  }

  void _stopAnimation() {
    // Останавливаем анимацию
    _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Fade Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FadeTransition для плавного изменения видимости виджета
            FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 60),
            // Кнопки управления анимацией
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startAnimation,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: const Text('Запуск анимации'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _stopAnimation,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: const Text('Остановить анимацию'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
