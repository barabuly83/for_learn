import 'package:flutter/material.dart';

import 'app.dart';
import 'core/app_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the application
  await AppInitializer.initialize();

  runApp(const MyApp());
}
