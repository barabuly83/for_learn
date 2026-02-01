import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note_model.dart';
import 'notes_list.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _addNote() {
    final title = _titleController.text.trim();
    if (title.isNotEmpty) {
      context.read<NoteModel>().addNote(title);
      _titleController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заметки'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Поле ввода для заголовка заметки
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Заголовок заметки',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _addNote(),
            ),
            const SizedBox(height: 16),
            // Кнопка для добавления заметки
            ElevatedButton(
              onPressed: _addNote,
              child: const Text('Добавить заметку'),
            ),
            const SizedBox(height: 16),
            // Список заметок
            const Expanded(child: NotesList()),
          ],
        ),
      ),
    );
  }
}
