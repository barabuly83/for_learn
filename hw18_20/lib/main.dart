import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'core/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Инициализация DI контейнера
  await di.init();

  print('🚀 Запуск приложения - подключение к Firebase Production');
  print('📍 Firestore: ${DefaultFirebaseOptions.currentPlatform.projectId}');
  print('💡 Используется production database с существующими задачами');

  runApp(const MyApp());
}
