import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/firebase_storage_service.dart';
import 'core/injection_container.dart' as di;
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Инициализируем эмуляторы
  await di.init();

  // Подключаемся к Firebase Storage эмулятору
  await di.sl<FirebaseStorageService>().connectToEmulator();

  runApp(const MyApp());
}
