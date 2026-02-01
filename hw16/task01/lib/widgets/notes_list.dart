import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note_model.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteModel>(
      builder: (context, noteModel, child) {
        final notes = noteModel.notes;
        if (notes.isEmpty) {
          return const Center(child: Text('Нет заметок'));
        }
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                title: Text(note.title),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => noteModel.removeNote(index),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
