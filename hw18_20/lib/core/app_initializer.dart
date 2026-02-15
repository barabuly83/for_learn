import 'package:firebase_core/firebase_core.dart';

import '../firebase_options.dart';
import 'injection_container.dart' as di;

/// Service responsible for initializing the application
class AppInitializer {
  // Private constructor to prevent instantiation
  AppInitializer._();
  static Future<void> initialize() async {
    // Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Initialize dependency injection
    await di.init();

    // Note: Firebase Storage emulator connection removed
    // Avatars are now stored locally
  }
}
