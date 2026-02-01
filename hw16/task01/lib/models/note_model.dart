import 'package:flutter/foundation.dart';
import 'note.dart';

class NoteModel extends ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes => List.unmodifiable(_notes);

  void addNote(String title) {
    _notes.add(Note(title: title));
    notifyListeners();
  }

  void removeNote(int index) {
    if (index >= 0 && index < _notes.length) {
      _notes.removeAt(index);
      notifyListeners();
    }
  }
}