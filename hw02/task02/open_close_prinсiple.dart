// ==================== 1. Базовый интерфейс конвертера ====================
// Определяет общий контракт для всех конвертеров
// Этот интерфейс закрыт для изменения - он не будет меняться при добавлении новых форматов
// Но открыт для расширения - мы можем создать новые классы, реализующие этот интерфейс
abstract interface class FileConverter {
  void convert(String filePath);

  // Метод для получения поддерживаемого формата
  // Полезно для автоматической регистрации конвертеров
  String get supportedFormat;
}

// ==================== 2. Конкретные реализации конвертеров ====================
// Каждый класс отвечает за конвертацию в конкретный формат
// Классы независимы друг от друга и могут разрабатываться/тестироваться отдельно

/// Конвертер в PDF формат
/// Причина создания отдельного класса: логика конвертации в PDF может быть сложной
/// и требовать специфичных библиотек или алгоритмов
class PdfConverter implements FileConverter {
  @override
  void convert(String filePath) {
    // В реальном приложении здесь была бы сложная логика конвертации в PDF:
    // - Парсинг исходного файла
    // - Генерация PDF структуры
    // - Оптимизация размера
    // - Добавление метаданных
    print("Конвертируем $filePath в PDF...");
  }

  @override
  String get supportedFormat => "pdf";
}

/// Конвертер в DOCX формат
/// Причина создания отдельного класса: конвертация в DOCX имеет свою специфику
class DocxConverter implements FileConverter {
  @override
  void convert(String filePath) {
    // Специфичная логика для DOCX формата:
    // - Работа с Office Open XML
    // - Сохранение стилей документов
    // - Обработка таблиц и изображений
    print("Конвертируем $filePath в DOCX...");
  }

  @override
  String get supportedFormat => "docx";
}

/// Конвертер в JPG формат
/// Причина создания отдельного класса: работа с изображениями требует
/// специфичных библиотек и алгоритмов сжатия
class JpgConverter implements FileConverter {
  @override
  void convert(String filePath) {
    // Логика для работы с изображениями:
    // - Изменение размера
    // - Сжатие с потерями/без потерь
    // - Коррекция цвета
    // - Добавление водяных знаков
    print("Конвертируем $filePath в JPG...");
  }

  @override
  String get supportedFormat => "jpg";
}

// ==================== 3. Фабрика конвертеров ====================
/// Создает и управляет экземплярами конвертеров
/// Паттерн "Фабрика" скрывает сложность создания объектов
class ConverterFactory {
  /// Реестр зарегистрированных конвертеров
  /// Ключ - формат файла, значение - функция-создатель конвертера
  final Map<String, FileConverter Function()> _converters = {};

  /// Регистрирует новый тип конвертера
  /// Это позволяет расширять систему без изменения существующего кода
  void registerConverter(String format, FileConverter Function() creator) {
    _converters[format.toLowerCase()] = creator;
  }

  /// Создает конвертер для указанного формата
  /// Возвращает null, если формат не поддерживается
  FileConverter? createConverter(String format) {
    final creator = _converters[format.toLowerCase()];
    return creator?.call();
  }

  /// Возвращает список всех поддерживаемых форматов
  List<String> getSupportedFormats() {
    return _converters.keys.toList();
  }
}

// ==================== 4. Основной сервис конвертации ====================
/// Координирует процесс конвертации файлов
/// Класс закрыт для изменения - его не нужно менять при добавлении новых форматов
/// Но открыт для расширения - можно добавить новые методы для работы с конвертерами
class FileConversionService {
  final ConverterFactory _converterFactory;

  FileConversionService(this._converterFactory);

  /// Основной метод конвертации
  /// Принимает формат и путь к файлу, делегирует работу конкретному конвертеру
  void convertFile(String fileType, String filePath) {
    // Получаем конвертер из фабрики
    final converter = _converterFactory.createConverter(fileType);

    if (converter != null) {
      // Если конвертер найден - выполняем конвертацию
      converter.convert(filePath);
    } else {
      // Если формат не поддерживается - выбрасываем исключение
      throw UnsupportedFormatException(
        fileType,
        _converterFactory.getSupportedFormats()
      );
    }
  }

  /// Дополнительный метод для пакетной конвертации
  /// Демонстрирует расширяемость класса без изменения существующей логики
  void convertMultipleFiles(List<Map<String, String>> files) {
    for (var file in files) {
      try {
        convertFile(file['format']!, file['path']!);
      } catch (e) {
        print("Ошибка при конвертации ${file['path']}: $e");
      }
    }
  }
}

// ==================== 5. Специальное исключение ====================
/// Кастомное исключение для неподдерживаемых форматов
/// Позволяет передавать дополнительную информацию о поддерживаемых форматах
class UnsupportedFormatException implements Exception {
  final String unsupportedFormat;
  final List<String> supportedFormats;

  UnsupportedFormatException(this.unsupportedFormat, this.supportedFormats);

  @override
  String toString() {
    return "Неизвестный формат файла: $unsupportedFormat. "
           "Поддерживаемые форматы: ${supportedFormats.join(', ')}";
  }
}

// ==================== 6. Инициализатор приложения ====================
/// Отвечает за настройку зависимостей и регистрацию конвертеров
/// Вынесена в отдельный класс для улучшения тестируемости и переиспользования
class AppInitializer {
  static FileConversionService initialize() {
    // Создаем фабрику конвертеров
    final converterFactory = ConverterFactory();

    // Регистрируем все поддерживаемые конвертеры
    // ДЛЯ ДОБАВЛЕНИЯ НОВОГО ФОРМАТА НУЖНО ТОЛЬКО ДОБАВИТЬ ЗДЕСЬ НОВУЮ СТРОЧКУ!
    converterFactory.registerConverter('pdf', () => PdfConverter());
    converterFactory.registerConverter('docx', () => DocxConverter());
    converterFactory.registerConverter('jpg', () => JpgConverter());

    // Создаем и возвращаем сервис конвертации
    return FileConversionService(converterFactory);
  }
}

// ==================== 7. Пример нового конвертера ====================
/// Демонстрация легкости добавления нового формата
/// Для добавления поддержки PNG нужно создать только этот класс
/// и зарегистрировать его в AppInitializer
class PngConverter implements FileConverter {
  @override
  void convert(String filePath) {
    // Специфичная логика для PNG формата:
    // - Поддержка прозрачности (альфа-канал)
    // - Сжатие без потерь
    // - Оптимизация палитры
    print("Конвертируем $filePath в PNG...");
  }

  @override
  String get supportedFormat => "png";
}

// ==================== 8. Пример расширенного конвертера ====================
/// Демонстрация расширенной функциональности без изменения существующих классов
/// Этот конвертер добавляет логирование и валидацию
class PdfConverterWithLogging implements FileConverter {
  final PdfConverter _pdfConverter = PdfConverter();

  @override
  void convert(String filePath) {
    print("[ЛОГ] Начало конвертации в PDF: $filePath");

    // Валидация файла (пример дополнительной функциональности)
    if (!_validateFile(filePath)) {
      throw Exception("Некорректный файл: $filePath");
    }

    // Основная конвертация
    _pdfConverter.convert(filePath);

    print("[ЛОГ] Конвертация завершена успешно");
  }

  bool _validateFile(String filePath) {
    // Проверка существования файла, его размера, формата и т.д.
    return filePath.isNotEmpty;
  }

  @override
  String get supportedFormat => "pdf";
}

// ==================== 9. Тестовые сценарии ====================
/// Демонстрация различных способов использования системы
void runTestScenarios() {
  print("=== Тест 1: Базовые сценарии ===");

  // Инициализируем приложение
  final conversionService = AppInitializer.initialize();

  // Выполняем конвертацию
  conversionService.convertFile("pdf", "document.txt");
  conversionService.convertFile("docx", "report.txt");

  print("\n=== Тест 2: Неподдерживаемый формат ===");
  try {
    conversionService.convertFile("gif", "animation.txt");
  } catch (e) {
    print("Ожидаемая ошибка: $e");
  }

  print("\n=== Тест 3: Пакетная конвертация ===");
  final filesToConvert = [
    {"format": "pdf", "path": "file1.txt"},
    {"format": "docx", "path": "file2.txt"},
    {"format": "jpg", "path": "file3.txt"},
  ];
  conversionService.convertMultipleFiles(filesToConvert);

  print("\n=== Тест 4: Получение списка форматов ===");
  // Для получения фабрики можно создать отдельный метод или использовать инжекцию
  // В этом примере просто показываем концепцию
}

// ==================== 10. Основная функция ====================
void main() {
  print("=== Демонстрация принципа открытости/закрытости ===\n");

  // Запускаем тестовые сценарии
  runTestScenarios();

  print("\n=== Демонстрация расширяемости ===");

  // Создаем расширенную версию с дополнительным конвертером
  final extendedFactory = ConverterFactory();
  extendedFactory.registerConverter('pdf', () => PdfConverterWithLogging());
  extendedFactory.registerConverter('docx', () => DocxConverter());
  extendedFactory.registerConverter('jpg', () => JpgConverter());
  extendedFactory.registerConverter('png', () => PngConverter());

  final extendedService = FileConversionService(extendedFactory);

  print("Добавлен новый формат PNG и улучшенный PDF конвертер с логированием");
  print("Поддерживаемые форматы: ${extendedFactory.getSupportedFormats().join(', ')}");

  try {
    extendedService.convertFile("png", "image.txt");
    extendedService.convertFile("pdf", "document.txt");
  } catch (e) {
    print("Ошибка: $e");
  }
}

// ==================== 11. Пример использования в реальном приложении ====================
/*
// Этот код показывает, как система может использоваться в реальном приложении

class FileProcessor {
  final FileConversionService _conversionService;

  FileProcessor(this._conversionService);

  void processUserRequest(String format, String filePath) {
    try {
      _conversionService.convertFile(format, filePath);
      print("Файл успешно сконвертирован");
    } on UnsupportedFormatException catch (e) {
      print("Ошибка: ${e.toString()}");
      // Предложить пользователю выбрать другой формат
    } catch (e) {
      print("Неизвестная ошибка: $e");
    }
  }
}

void realWorldExample() {
  final conversionService = AppInitializer.initialize();
  final processor = FileProcessor(conversionService);

  // Пользовательский ввод
  processor.processUserRequest("pdf", "my_document.txt");
  processor.processUserRequest("exe", "program.txt"); // Неподдерживаемый формат
}
*/