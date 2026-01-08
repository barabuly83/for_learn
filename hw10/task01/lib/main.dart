import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TransitionAnimationScreen(),
    );
  }
}

class TransitionAnimationScreen extends StatefulWidget {
  const TransitionAnimationScreen({super.key});

  @override
  State<TransitionAnimationScreen> createState() => _TransitionAnimationScreenState();
}

class _TransitionAnimationScreenState extends State<TransitionAnimationScreen> {
  // Индекс текущего видимого контейнера (0 или 1)
  int _currentIndex = 0;

  void _toggleContainers() {
    setState(() {
      // Переключаем между контейнерами
      _currentIndex = _currentIndex == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Анимация перехода'),
      ),
      body: GestureDetector(
        onTap: _toggleContainers,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              // Комбинируем fade и scale анимации для плавного перехода
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            },
            child: _currentIndex == 0
                ? AnimatedContainer(
                    key: const ValueKey(0),
                    width: 200,
                    height: 200,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        'Контейнер 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : AnimatedContainer(
                    key: const ValueKey(1),
                    width: 300,
                    height: 150,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        'Контейнер 2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
