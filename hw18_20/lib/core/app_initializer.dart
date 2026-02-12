import 'package:firebase_core/firebase_core.dart';

import '../firebase_options.dart';
import 'firebase_storage_service.dart';
import 'injection_container.dart' as di;

/// Service responsible for initializing the application
class AppInitializer {
  static Future<void> initialize() async {
    // Initialize Firebase
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    // Initialize dependency injection
    await di.init();

    // Connect to Firebase Storage emulator
    await di.sl<FirebaseStorageService>().connectToEmulator();
  }
}