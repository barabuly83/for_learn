import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/note_model.dart';
import 'widgets/notes_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteModel(),
      child: MaterialApp(
        title: 'Notes App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const NotesPage(),
      ),
    );
  }
}