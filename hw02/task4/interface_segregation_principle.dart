// ==================== 1. Разделенные интерфейсы ====================
// ИСПРАВЛЕНИЕ: Используем ключевое слово 'abstract class' вместо 'abstract'
abstract class Openable {
  void open(String filePath);
}

abstract class Readable {
  void readText();
}

abstract class Playable {
  void playAudio();
}

abstract class WithMetadata {
  Map<String, String> getMetadata();
  void setMetadata(String key, String value);
}

// ==================== 2. Класс текстового файла ====================
class TextFileHandler implements Openable, Readable {
  String _content = "";

  @override
  void open(String filePath) {
    print("Открываем текстовый файл: $filePath");
    _content = "Это содержимое текстового файла";
  }

  @override
  void readText() {
    if (_content.isEmpty) {
      print("Файл не был открыт или пуст");
    } else {
      print("Читаем текст: $_content");
    }
  }

  void countWords() {
    final wordCount = _content.split(' ').length;
    print("Количество слов в тексте: $wordCount");
  }
}

// ==================== 3. Класс аудиофайла ====================
class AudioFileHandler implements Openable, Playable {
  String _audioFormat = "MP3";

  @override
  void open(String filePath) {
    print("Открываем аудиофайл: $filePath");
  }

  @override
  void playAudio() {
    print("Воспроизводим аудио (формат: $_audioFormat)...");
  }

  void setVolume(double volume) {
    print("Громкость установлена на $volume%");
  }
}

// ==================== 4. Класс файла с метаданными ====================
class RichTextFile implements Openable, Readable, WithMetadata {
  String _content = "";
  final Map<String, String> _metadata = {};

  @override
  void open(String filePath) {
    print("Открываем файл с метаданными: $filePath");
    _content = "Это содержимое файла с метаданными";
    _metadata["author"] = "Иван Иванов";
  }

  @override
  void readText() {
    print("Читаем текст с метаданными: $_content");
  }

  @override
  Map<String, String> getMetadata() {
    return Map<String, String>.from(_metadata);
  }

  @override
  void setMetadata(String key, String value) {
    _metadata[key] = value;
    print("Метаданные обновлены: $key = $value");
  }
}

// ==================== 5. Классы для демонстрации нарушения ISP ====================
// ИСПРАВЛЕНИЕ: Вынесены на верхний уровень (нельзя определять классы внутри функций в Dart)
abstract class BadFileHandler {
  void open(String filePath);
  void readText();
  void playAudio();
}

class BadTextFileHandler implements BadFileHandler {
  @override
  void open(String filePath) => print("Открываем текстовый файл: $filePath");

  @override
  void readText() => print("Читаем текст");

  @override
  void playAudio() => throw Exception("Ошибка: текстовый файл не поддерживает аудио!");
}

class BadAudioFileHandler implements BadFileHandler {
  @override
  void open(String filePath) => print("Открываем аудиофайл: $filePath");

  @override
  void readText() => throw Exception("Ошибка: аудиофайл не содержит текст!");

  @override
  void playAudio() => print("Воспроизводим аудио...");
}

// ==================== 6. Обработчик файлов ====================
// ИСПРАВЛЕНИЕ: Метод processFile теперь использует явные приведения типов
class FileProcessor {
  /// Безопасная обработка файла с проверкой поддерживаемых интерфейсов
  static void processFile(Openable file, String filePath) {
    // Открываем файл (поддерживают все)
    file.open(filePath);

    // ИСПРАВЛЕНИЕ: Явное приведение типов с помощью 'as'
    // Проверяем и приводим тип для Readable
    if (file is Readable) {
      // Приводим тип к Readable
      final readableFile = file as Readable;
      readableFile.readText();
    }

    // Проверяем и приводим тип для Playable
    if (file is Playable) {
      // Приводим тип к Playable
      final playableFile = file as Playable;
      playableFile.playAudio();
    }

    // Проверяем и приводим тип для WithMetadata
    if (file is WithMetadata) {
      // Приводим тип к WithMetadata
      final fileWithMetadata = file as WithMetadata;
      final metadata = fileWithMetadata.getMetadata();
      print("Метаданные файла: $metadata");
    }

    print("--- Обработка файла завершена ---");
  }

  /// Специализированная обработка только текстовых файлов
  static void processTextFile(Readable file) {
    print("Специализированная обработка текстового файла:");
    file.readText();
  }

  /// Специализированная обработка только аудиофайлов
  static void processAudioFile(Playable file) {
    print("Специализированная обработка аудиофайла:");
    file.playAudio();
  }
}

// ==================== 7. Демонстрация проблемы исходного кода ====================
void demonstrateOriginalProblem() {
  print("=== Демонстрация нарушения ISP (исходный код) ===\n");

  // Используем уже определенные на верхнем уровне классы
  List<BadFileHandler> badFiles = [
    BadTextFileHandler(),
    BadAudioFileHandler(),
  ];

  print("Обработка файлов в исходной реализации (нарушение ISP):");
  for (var file in badFiles) {
    try {
      file.open("file.txt");
      file.readText(); // Ошибка для аудиофайла!
      file.playAudio(); // Ошибка для текстового файла!
    } catch (e) {
      print("Программа упала с ошибкой: $e");
      print("Это нарушение ISP! Классы вынуждены реализовывать методы, которые им не нужны");
    }
  }
}

// ==================== 8. Примеры корректного использования ====================
void demonstrateCorrectUsage() {
  print("\n=== Пример корректного использования с соблюдением ISP ===\n");

  // Создаем файлы разных типов
  final textFile = TextFileHandler();
  final audioFile = AudioFileHandler();
  final richTextFile = RichTextFile();

  print("1. Обработка текстового файла:");
  FileProcessor.processFile(textFile, "document.txt");

  print("\n2. Обработка аудиофайла:");
  FileProcessor.processFile(audioFile, "song.mp3");

  print("\n3. Обработка файла с метаданными:");
  FileProcessor.processFile(richTextFile, "document.rtf");

  print("\n4. Специализированная обработка:");
  print("Только текстовые операции:");
  FileProcessor.processTextFile(textFile);

  print("\nТолько аудио операции:");
  FileProcessor.processAudioFile(audioFile);
}

// ==================== 9. Дополнительные примеры ====================
void demonstrateFlexibility() {
  print("\n=== Демонстрация гибкости разделенных интерфейсов ===\n");

  // Коллекция открываемых файлов
  List<Openable> openableFiles = [
    TextFileHandler(),
    AudioFileHandler(),
    RichTextFile(),
  ];

  print("Все файлы можно открыть (общий интерфейс Openable):");
  for (var file in openableFiles) {
    file.open("some_file.xyz");
  }

  print("\nТолько читаемые файлы (интерфейс Readable):");
  for (var file in openableFiles) {
    // ИСПРАВЛЕНИЕ: Явное приведение типа после проверки
    if (file is Readable) {
      final readableFile = file as Readable;
      readableFile.readText();
    } else {
      print("${file.runtimeType} не поддерживает чтение текста");
    }
  }

  print("\nТолько воспроизводимые файлы (интерфейс Playable):");
  for (var file in openableFiles) {
    // ИСПРАВЛЕНИЕ: Явное приведение типа после проверки
    if (file is Playable) {
      final playableFile = file as Playable;
      playableFile.playAudio();
    } else {
      print("${file.runtimeType} не поддерживает воспроизведение аудио");
    }
  }
}

// ==================== 10. Основная функция ====================
void main() {
  print("=== Принцип разделения интерфейсов (ISP) ===\n");

  // Демонстрируем проблему исходного кода
  demonstrateOriginalProblem();

  print("\n" + "="*60 + "\n");

  // Демонстрируем корректное решение
  demonstrateCorrectUsage();

  // Демонстрируем гибкость
  demonstrateFlexibility();

  print("\n" + "="*60);
  print("\nПреимущества соблюдения ISP:");
  print("1. Классы не зависят от методов, которые они не используют");
  print("2. Нет необходимости выбрасывать исключения в ненужных методах");
  print("3. Упрощается добавление новых типов файлов");
  print("4. Улучшается читаемость и поддерживаемость кода");
  print("5. Легче тестировать отдельные компоненты");
  print("6. Снижается связность между компонентами системы");
}