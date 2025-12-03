// ==================== 1. Базовые интерфейсы ====================
// ИЗМЕНЕНИЕ: Разделили один большой интерфейс на несколько маленьких
// ПРИЧИНА: Классы должны реализовывать только те интерфейсы, которые им действительно нужны
// По принципу ISP (Interface Segregation Principle)
abstract class Uploadable {
  void upload(String filePath);
}

abstract class Convertible {
  void convert(String filePath);
}

abstract class Encryptable {
  void decrypt(String filePath);
  void encrypt(String filePath);
}

// ==================== 2. Класс обычного PDF файла ====================
// ИЗМЕНЕНИЕ: Реализуем только нужные интерфейсы (Uploadable и Convertible)
// ПРИЧИНА: PDF файл поддерживает и загрузку, и конвертацию
class PdfFile implements Uploadable, Convertible {
  final String _format = "PDF";

  @override
  void upload(String filePath) {
    print('Загружен $_format файл: $filePath');
  }

  @override
  void convert(String filePath) {
    print('Конвертируем $filePath в $_format...');
  }

  // Дополнительный метод, не нарушающий LSP
  void compress(String filePath) {
    print('Сжимаем PDF файл: $filePath');
  }
}

// ==================== 3. Класс зашифрованного файла ====================
// ИЗМЕНЕНИЕ: Не реализуем Convertible, так как зашифрованные файлы по умолчанию не конвертируются
// ПРИЧИНА: Соответствует реальной ситуации - зашифрованный файл нельзя конвертировать без расшифровки
// Это решает проблему исходного кода, где EncryptedFile вынужден был реализовывать convert()
class EncryptedFile implements Uploadable, Encryptable {
  final String _encryptionType;

  EncryptedFile(this._encryptionType);

  @override
  void upload(String filePath) {
    print('Загружен зашифрованный файл ($_encryptionType): $filePath');
  }

  @override
  void decrypt(String filePath) {
    print('Расшифровываем файл $filePath с использованием $_encryptionType...');
  }

  @override
  void encrypt(String filePath) {
    print('Шифруем файл $filePath с использованием $_encryptionType...');
  }

  // Специфичные методы для зашифрованных файлов
  void verifySignature(String filePath) {
    print('Проверяем цифровую подпись файла: $filePath');
  }
}

// ==================== 4. Класс конвертируемого зашифрованного файла ====================
// ИЗМЕНЕНИЕ: Новый класс, который явно показывает, что файл и зашифрован, и конвертируем
// ПРИЧИНА: Если файл может быть конвертирован после расшифровки, это должен быть отдельный тип
// Это предотвращает нарушение LSP - клиент ясно видит, что этот файл поддерживает конвертацию
class ConvertibleEncryptedFile implements Uploadable, Convertible, Encryptable {
  final String _targetFormat;
  final String _encryptionType;

  ConvertibleEncryptedFile(this._targetFormat, this._encryptionType);

  @override
  void upload(String filePath) {
    print('Загружен зашифрованный файл ($_encryptionType) для конвертации в $_targetFormat: $filePath');
  }

  @override
  void convert(String filePath) {
    // Сначала расшифровываем, потом конвертируем - логика четко определена
    decrypt(filePath);
    print('Конвертируем расшифрованный файл $filePath в $_targetFormat...');
  }

  @override
  void decrypt(String filePath) {
    print('Расшифровываем файл $filePath для конвертации...');
  }

  @override
  void encrypt(String filePath) {
    print('Шифруем файл $filePath...');
  }
}

// ==================== 5. Адаптер для конвертации зашифрованных файлов ====================
// ИЗМЕНЕНИЕ: Добавлен паттерн "Адаптер" для особых случаев
// ПРИЧИНА: Если нам нужно временно сделать EncryptedFile конвертируемым, используем адаптер
// Это альтернатива наследованию и не нарушает LSP
class EncryptedFileConverterAdapter implements Convertible {
  final EncryptedFile _encryptedFile;
  final String _targetFormat;

  EncryptedFileConverterAdapter(this._encryptedFile, this._targetFormat);

  @override
  void convert(String filePath) {
    print('Адаптер: Конвертация зашифрованного файла в $_targetFormat');

    _encryptedFile.decrypt(filePath);
    print('Конвертируем расшифрованный файл $filePath в $_targetFormat...');

    final resultFilePath = '$filePath.$_targetFormat';
    _encryptedFile.encrypt(resultFilePath);

    print('Конвертация завершена: $resultFilePath');
  }
}

// ==================== 6. Фабрика для создания файлов ====================
// ИЗМЕНЕНИЕ: Добавлена фабрика для создания объектов
// ПРИЧИНА: Централизует логику создания объектов, упрощает поддержку
class FileFactory {
  static Uploadable createFile(String type, [Map<String, dynamic>? params]) {
    switch (type.toLowerCase()) {
      case 'pdf':
        return PdfFile();
      case 'encrypted':
        final encryptionType = params?['encryptionType'] ?? 'AES-256';
        return EncryptedFile(encryptionType);
      case 'convertible_encrypted':
        final format = params?['format'] ?? 'PDF';
        final encryptionType = params?['encryptionType'] ?? 'AES-256';
        return ConvertibleEncryptedFile(format, encryptionType);
      default:
        throw ArgumentError('Неизвестный тип файла: $type');
    }
  }
}

// ==================== 7. Обработчик файлов ====================
// ИЗМЕНЕНИЕ: Разделили обработку на отдельные методы для каждого типа операций
// ПРИЧИНА: Каждый метод работает с конкретным интерфейсом, что соответствует SRP
class FileProcessor {
  static void processUpload(Uploadable file, String filePath) {
    file.upload(filePath);
  }

  static void processConversion(Convertible file, String filePath) {
    file.convert(filePath);
  }

  static void processEncryption(Encryptable file, String filePath, {bool encrypt = true}) {
    if (encrypt) {
      file.encrypt(filePath);
    } else {
      file.decrypt(filePath);
    }
  }

  // ИЗМЕНЕНИЕ: Метод processFile теперь принимает dynamic и проверяет типы
  // ПРИЧИНА: В DartPad были проблемы с выводом типов, нужно явное приведение
  // КОММЕНТАРИЙ К ИСПРАВЛЕНИЮ ОШИБКИ: Используем 'as' для явного приведения типов
  static void processFile(dynamic file, String filePath) {
    // Все файлы должны быть загружены
    if (file is Uploadable) {
      processUpload(file, filePath);
    } else {
      throw ArgumentError('Файл не поддерживает загрузку');
    }

    // Если файл поддерживает конвертацию - конвертируем
    // ИСПРАВЛЕНИЕ ОШИБКИ: DartPad не сужает тип автоматически, нужен явный cast
    if (file is Convertible) {
      // Явное приведение типа с помощью 'as' решает проблему компиляции
      processConversion(file as Convertible, filePath);
    }

    // Если файл зашифрованный - работаем с шифрованием
    // ИСПРАВЛЕНИЕ ОШИБКИ: Та же проблема - нужен явный cast
    if (file is Encryptable) {
      // Явное приведение типа с помощью 'as'
      processEncryption(file as Encryptable, filePath, encrypt: false);
    }
  }
}

// ==================== 8. Классы для демонстрации нарушения LSP ====================
// ИЗМЕНЕНИЕ: Создали отдельные классы для демонстрации проблемы
// ПРИЧИНА: Чтобы показать, как НЕЛЬЗЯ проектировать иерархию классов
abstract class ProblematicFileProcessor {
  void upload(String filePath);
  void convert(String filePath);
}

class ProblematicPdfFile extends ProblematicFileProcessor {
  @override
  void upload(String filePath) => print('Загружен PDF: $filePath');

  @override
  void convert(String filePath) => print('Конвертация PDF: $filePath');
}

// ИЗМЕНЕНИЕ: Этот класс демонстрирует нарушение LSP
// ПРИЧИНА: Он наследует ProblematicFileProcessor, но не может выполнить convert()
// Нарушение LSP: подкласс не может заменить базовый класс без сбоев
class ProblematicEncryptedFile extends ProblematicFileProcessor {
  @override
  void upload(String filePath) => print('Загружен зашифрованный: $filePath');

  @override
  void convert(String filePath) => throw Exception('Нельзя конвертировать зашифрованный файл!');
}

// ==================== 9. Примеры использования ====================
void runLspCompliantExamples() {
  print('=== Пример 1: Корректная работа с PDF файлом ===');
  final pdfFile = PdfFile();
  FileProcessor.processFile(pdfFile, 'document.pdf');

  print('\n=== Пример 2: Корректная работа с зашифрованным файлом ===');
  final encryptedFile = EncryptedFile('RSA-2048');
  FileProcessor.processFile(encryptedFile, 'secret.enc');

  print('\n=== Пример 3: Корректная работа с конвертируемым зашифрованным файлом ===');
  final convertibleEncryptedFile = ConvertibleEncryptedFile('DOCX', 'AES-256');
  FileProcessor.processFile(convertibleEncryptedFile, 'report.enc');

  print('\n=== Пример 4: Использование адаптера ===');
  final encryptedFileForConversion = EncryptedFile('AES-128');
  final adapter = EncryptedFileConverterAdapter(encryptedFileForConversion, 'PDF');
  FileProcessor.processUpload(encryptedFileForConversion, 'document.enc');
  FileProcessor.processConversion(adapter, 'document.enc');

  print('\n=== Пример 5: Работа через фабрику ===');
  final files = [
    FileFactory.createFile('pdf'),
    FileFactory.createFile('encrypted', {'encryptionType': 'Blowfish'}),
    FileFactory.createFile('convertible_encrypted', {
      'format': 'JPG',
      'encryptionType': 'Twofish'
    }),
  ];

  for (var i = 0; i < files.length; i++) {
    print('\nОбработка файла ${i + 1}:');
    FileProcessor.processFile(files[i], 'file${i + 1}.dat');
  }
}

// ==================== 10. Упрощенная демонстрация проблемы LSP ====================
// ИЗМЕНЕНИЕ: Показываем, как нарушение LSP приводит к сбоям
// ПРИЧИНА: Наглядная демонстрация последствий неправильного проектирования
void demonstrateOriginalProblem() {
  print('=== Демонстрация нарушения LSP ===\n');

  print('1. Список файлов в исходной реализации (нарушение LSP):');

  // Создаем список файлов
  final List<ProblematicFileProcessor> problematicFiles = [
    ProblematicPdfFile(),
    ProblematicEncryptedFile(),
  ];

  // Обрабатываем файлы - программа упадет на втором файле!
  for (var file in problematicFiles) {
    try {
      file.upload('document.txt');
      file.convert('document.txt'); // УПС! Упадет на втором файле
    } catch (e) {
      print('Программа упала с ошибкой: $e');
      print('Это нарушение LSP! EncryptedFile не может заменить FileProcessor');
      print('Метод convert() в EncryptedFile выбрасывает исключение, чего не ожидает клиентский код');
    }
  }
}

// ==================== 11. Пример наследования с усилением ====================
// ИЗМЕНЕНИЕ: Показали правильное наследование с усилением функциональности
// ПРИЧИНА: Демонстрация как можно расширять классы без нарушения LSP
class AdvancedPdfFile extends PdfFile {
  @override
  void convert(String filePath) {
    // Сохраняем оригинальное поведение (важно для LSP!)
    super.convert(filePath);
    // Добавляем новую функциональность
    _optimizeForWeb(filePath);
    _addMetadata(filePath);
  }

  void _optimizeForWeb(String filePath) {
    print('Оптимизируем PDF для веба: $filePath');
  }

  void _addMetadata(String filePath) {
    print('Добавляем метаданные в PDF: $filePath');
  }

  // Новый метод, не нарушающий LSP
  void createTableOfContents(String filePath) {
    print('Создаем оглавление для PDF: $filePath');
  }
}

void demonstrateEnhancedFunctionality() {
  print('\n=== Пример усиления функциональности без нарушения LSP ===');
  final advancedPdf = AdvancedPdfFile();

  // AdvancedPdfFile может использоваться везде, где ожидается PdfFile
  PdfFile pdfReference = advancedPdf;

  pdfReference.upload('thesis.pdf');
  pdfReference.convert('thesis.pdf'); // Работает корректно

  // Дополнительная функциональность доступна при явном использовании типа
  advancedPdf.createTableOfContents('thesis.pdf');
}

// ==================== 12. Дополнительные примеры ====================
// ИЗМЕНЕНИЕ: Показали работу с коллекциями разных типов
// ПРИЧИНА: Демонстрация полиморфизма и безопасного приведения типов
void demonstrateLspWithCollections() {
  print('\n=== Пример коллекций и LSP ===');

  // Создаем коллекцию загружаемых файлов
  List<Uploadable> uploadableFiles = [
    PdfFile(),
    EncryptedFile('AES-256'),
    ConvertibleEncryptedFile('PNG', 'RSA'),
  ];

  print('Обработка всех файлов как Uploadable:');
  for (var file in uploadableFiles) {
    file.upload('some_file.txt');
  }

  print('\nФильтрация конвертируемых файлов:');
  for (var file in uploadableFiles) {
    if (file is Convertible) {
      // ИСПРАВЛЕНИЕ ОШИБКИ: Явное приведение типа необходимо в DartPad
      final convertibleFile = file as Convertible;
      convertibleFile.convert('some_file.txt');
    } else {
      print('Файл типа ${file.runtimeType} не поддерживает конвертацию');
    }
  }
}

// ==================== 13. Основная функция ====================
void main() {
  print('=== Принцип подстановки Барбары Лисков (LSP) ===\n');

  // Демонстрируем проблему исходного кода
  demonstrateOriginalProblem();

  print('\n' + '='*60 + '\n');

  // Демонстрируем корректное решение
  print('=== Рефакторинг с соблюдением LSP ===\n');
  runLspCompliantExamples();

  // Демонстрируем расширенную функциональность
  demonstrateEnhancedFunctionality();

  // Демонстрируем работу с коллекциями
  demonstrateLspWithCollections();

  print('\n' + '='*60);
  print('\nКлючевые принципы LSP:');
  print('1. Подклассы должны быть взаимозаменяемы с базовыми классами');
  print('2. Подклассы не должны ужесточать предусловия');
  print('3. Подклассы не должны ослаблять постусловия');
  print('4. Исторические ограничения должны сохраняться');
  print('5. Не должно быть неожиданных исключений в методах подклассов');
}