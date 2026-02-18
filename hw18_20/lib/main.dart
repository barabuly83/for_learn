import 'package:flutter/material.dart';

import 'app.dart';
import 'core/app_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitializer.initialize();

  runApp(const MyApp());
}
