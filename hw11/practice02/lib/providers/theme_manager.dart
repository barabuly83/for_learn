import 'package:flutter/material.dart';
import 'theme_provider.dart';

class ThemeManager extends StatefulWidget {
  final Widget child;

  const ThemeManager({
    super.key,
    required this.child,
  });

  @override
  State<ThemeManager> createState() => ThemeManagerState();

  static ThemeManagerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ThemeManagerState>();
  }
}

class ThemeManagerState extends State<ThemeManager> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  ThemeMode get themeMode => _themeMode;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themeMode: _themeMode,
      toggleTheme: toggleTheme,
      child: widget.child,
    );
  }
}
}

class _ThemeManagerState extends State<ThemeManager> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  ThemeMode get themeMode => _themeMode;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themeMode: _themeMode,
      toggleTheme: toggleTheme,
      child: widget.child,
    );
  }
}