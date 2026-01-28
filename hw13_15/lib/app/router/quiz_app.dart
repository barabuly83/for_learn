import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/auth_service.dart';
import '../../domain/models/quiz_service.dart';
import '../../domain/models/storage_service.dart';
import '../../l10n/l10n.dart';
import '../../domain/models/app_services.dart';

class QuizApp extends StatelessWidget {
  final AuthService authService;
  final QuizService quizService;
  final FirebaseStorage storage;
  final StorageService storageService;
  final GoRouter router;

  QuizApp({
    super.key,
    required this.authService,
    required this.quizService,
    required this.storage,
    required this.router,
  }) : storageService = StorageServiceImpl(storage: storage);

  @override
  Widget build(BuildContext context) {
    return AppServices(
      authService: authService,
      quizService: quizService,
      storage: storage,
      storageService: storageService,
      child: MaterialApp.router(
        title: 'Quiz App',
        routerConfig: router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        // debugShowPerformanceOverlay: true, // Недоступно для MaterialApp.router
      ),
    );
  }
}
