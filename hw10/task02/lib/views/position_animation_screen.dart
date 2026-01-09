import 'package:flutter/material.dart';

class PositionAnimationScreen extends StatefulWidget {
  const PositionAnimationScreen({super.key});

  @override
  State<PositionAnimationScreen> createState() => _PositionAnimationScreenState();
}

class _PositionAnimationScreenState extends State<PositionAnimationScreen> {
  bool _isTopLeft = true;

  void _togglePosition() {
    setState(() {
      _isTopLeft = !_isTopLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const circleSize = 80.0;
    const padding = 50.0;

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
              top: _isTopLeft 
                  ? padding 
                  : screenSize.height - padding - circleSize - kToolbarHeight - MediaQuery.of(context).padding.top,
              left: _isTopLeft 
                  ? padding 
                  : screenSize.width - padding - circleSize,
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeInOutCubic,
              child: Container(
                width: circleSize,
                height: circleSize,
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

