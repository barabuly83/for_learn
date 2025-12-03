// ==================== 1. БАЗОВЫЙ ИНТЕРФЕЙС ДЛЯ ВСЕХ КОНВЕРТЕРОВ ====================
// ИСХОДНЫЙ ПРОБЛЕМНЫЙ КОД: Не было общего интерфейса для конвертеров
// ИЗМЕНЕНИЕ: Создаем абстракцию, от которой будут зависеть все модули
// ПРИЧИНА: Соблюдение DIP - модули высокого уровня должны зависеть от абстракций
abstract class FileConverter {
  void convert(String filePath);

  // Дополнительный метод для получения информации о конвертере
  String get converterInfo;
}

// ==================== 2. КОНКРЕТНЫЕ РЕАЛИЗАЦИИ КОНВЕРТЕРОВ ====================
// ИСХОДНЫЙ КОД: Классы PdfConverter и DocxConverter были независимыми
// ИЗМЕНЕНИЕ: Теперь они реализуют общий интерфейс FileConverter
// ПРИЧИНА: Создание единого контракта для всех конвертеров
class PdfConverter implements FileConverter {
  @override
  void convert(String filePath) {
    print("Конвертация $filePath в PDF...");
  }

  @override
  String get converterInfo => "PDF Converter v1.0";

  void compressPdf(String filePath) {
    print("Сжатие PDF файла: $filePath");
  }
}

class DocxConverter implements FileConverter {
  @override
  void convert(String filePath) {
    print("Конвертация $filePath в DOCX...");
  }

  @override
  String get converterInfo => "DOCX Converter v1.0";

  void addWatermark(String filePath, String watermark) {
    print("Добавление водяного знака '$watermark' в DOCX: $filePath");
  }
}

// ==================== 3. НОВЫЙ КОНВЕРТЕР ====================
// ИЗМЕНЕНИЕ: Добавлен новый тип конвертера
// ПРИЧИНА: Показать, как легко можно расширять систему
class JpgConverter implements FileConverter {
  @override
  void convert(String filePath) {
    print("Конвертация $filePath в JPG...");
  }

  @override
  String get converterInfo => "JPG Converter v1.0";

  void resizeImage(String filePath, int width, int height) {
    print("Изменение размера изображения $filePath на ${width}x$height");
  }
}

// ==================== 4. МОК-КОНВЕРТЕР ДЛЯ ТЕСТИРОВАНИЯ ====================
// ИЗМЕНЕНИЕ: Вынесен на верхний уровень (нельзя внутри функции в Dart)
// ПРИЧИНА: DartPad не позволяет определять классы внутри функций
class MockConverter implements FileConverter {
  int callCount = 0;

  @override
  void convert(String filePath) {
    callCount++;
    print("Мок: конвертация $filePath (вызов №$callCount)");
  }

  @override
  String get converterInfo => "Mock Converter (только для тестирования)";
}

// ==================== 5. БЫСТРЫЙ PDF КОНВЕРТЕР ====================
// ИЗМЕНЕНИЕ: Вынесен на верхний уровень
// ПРИЧИНА: Нельзя определять классы внутри функций в Dart
class FastPdfConverter implements FileConverter {
  @override
  void convert(String filePath) {
    print("Быстрая конвертация $filePath в PDF (ускоренный алгоритм)");
  }

  @override
  String get converterInfo => "Fast PDF Converter (оптимизированная версия)";
}

// ==================== 6. ИНТЕРФЕЙС СЕРВИСА ДЛЯ УПРАВЛЕНИЯ КОНВЕРТАЦИЕЙ ====================
// ИСХОДНЫЙ ПРОБЛЕМНЫЙ КОД: FileConverter был конкретным классом, который создавал зависимости внутри себя
// ИЗМЕНЕНИЕ: Создаем интерфейс для сервиса конвертации
// ПРИЧИНА: Разделение абстракции и реализации, соблюдение DIP
abstract class FileConversionService {
  void convertToPdf(String filePath);
  void convertToDocx(String filePath);
  void convertTo(String format, String filePath);
  void registerConverter(String format, FileConverter converter);
  List<String> getAvailableFormats();
}

// ==================== 7. РЕАЛИЗАЦИЯ СЕРВИСА КОНВЕРТАЦИИ ====================
// ИЗМЕНЕНИЕ: FileConverter теперь зависит от абстракций, а не от конкретных классов
// ПРИЧИНА: Инверсия зависимостей - высокоуровневый модуль не зависит от низкоуровневых
class FileConversionServiceImpl implements FileConversionService {
  // ИСПРАВЛЕНИЕ: Заменили конкретные типы на абстракцию Map<String, FileConverter>
  final Map<String, FileConverter> _converters = {};

  // ИСПРАВЛЕНИЕ: Зависимости внедряются через конструктор
  FileConversionServiceImpl() {
    // Регистрируем конвертеры по умолчанию
    registerConverter('pdf', PdfConverter());
    registerConverter('docx', DocxConverter());
  }

  @override
  void convertToPdf(String filePath) {
    _converters['pdf']?.convert(filePath);
  }

  @override
  void convertToDocx(String filePath) {
    _converters['docx']?.convert(filePath);
  }

  @override
  void convertTo(String format, String filePath) {
    final converter = _converters[format.toLowerCase()];
    if (converter != null) {
      print("Используется конвертер: ${converter.converterInfo}");
      converter.convert(filePath);
    } else {
      print("Конвертер для формата '$format' не найден");
      print("Доступные форматы: ${_converters.keys.join(', ')}");
    }
  }

  @override
  void registerConverter(String format, FileConverter converter) {
    _converters[format.toLowerCase()] = converter;
    print("Зарегистрирован конвертер для формата: $format");
  }

  @override
  List<String> getAvailableFormats() {
    return _converters.keys.toList();
  }

  void batchConvert(List<Map<String, String>> files) {
    for (var file in files) {
      final format = file['format'];
      final path = file['path'];
      if (format != null && path != null) {
        convertTo(format, path);
      }
    }
  }
}

// ==================== 8. ФАБРИКА ДЛЯ СОЗДАНИЯ СЕРВИСА ====================
class FileConversionServiceFactory {
  static FileConversionService createDefault() {
    return FileConversionServiceImpl();
  }

  static FileConversionService createWithCustomConverters(List<FileConverter> converters) {
    final service = FileConversionServiceImpl();
    for (var converter in converters) {
      final format = converter.runtimeType.toString().toLowerCase().replaceAll('converter', '');
      service.registerConverter(format, converter);
    }
    return service;
  }
}

// ==================== 9. КЛАСС ДЛЯ ДЕМОНСТРАЦИИ НАРУШЕНИЯ DIP ====================
// ИСХОДНЫЙ ПРОБЛЕМНЫЙ КОД: Прямая зависимость от конкретных классов
class BadFileConverter {
  // ПРОБЛЕМА: Прямая зависимость от конкретных классов
  final PdfConverter pdfConverter = PdfConverter();
  final DocxConverter docxConverter = DocxConverter();

  void convertToPdf(String filePath) {
    pdfConverter.convert(filePath);
  }

  void convertToDocx(String filePath) {
    docxConverter.convert(filePath);
  }

  void convertToJpg(String filePath) {
    throw Exception("Метод не реализован!");
  }
}

// ==================== 10. КЛИЕНТСКИЙ КОД, КОТОРЫЙ ИСПОЛЬЗУЕТ СЕРВИС ====================
class DocumentProcessor {
  final FileConversionService _conversionService;

  // ИСПРАВЛЕНИЕ: Внедрение зависимости через конструктор
  DocumentProcessor(this._conversionService);

  void processDocument(String filePath, String targetFormat) {
    print("Обработка документа: $filePath");
    print("Целевой формат: $targetFormat");

    try {
      _conversionService.convertTo(targetFormat, filePath);
      print("Конвертация завершена успешно");
    } catch (e) {
      print("Ошибка при конвертации: $e");
    }
  }

  void processMultipleDocuments(List<String> filePaths, String targetFormat) {
    print("Пакетная обработка ${filePaths.length} документов в формат $targetFormat");
    for (var filePath in filePaths) {
      processDocument(filePath, targetFormat);
    }
  }
}

// ==================== 11. ДЕМОНСТРАЦИЯ ПРОБЛЕМЫ ИСХОДНОГО КОДА ====================
void demonstrateOriginalProblem() {
  print("=== ДЕМОНСТРАЦИЯ НАРУШЕНИЯ DIP (ИСХОДНЫЙ КОД) ===\n");

  final badConverter = BadFileConverter();

  print("1. Использование жестко зашитых конвертеров:");
  badConverter.convertToPdf("document.txt");
  badConverter.convertToDocx("document.txt");

  print("\n2. Проблема расширения:");
  try {
    badConverter.convertToJpg("image.png");
  } catch (e) {
    print("Ошибка: $e");
    print("ПРОБЛЕМА: Чтобы добавить поддержку JPG, нужно изменить класс BadFileConverter!");
  }

  print("\n3. Проблема тестирования:");
  print("Невозможно заменить PdfConverter на мок для тестирования!");
  print("Класс BadFileConverter жестко привязан к конкретным реализациям.");
}

// ==================== 12. ДЕМОНСТРАЦИЯ КОРРЕКТНОГО РЕШЕНИЯ ====================
void demonstrateCorrectSolution() {
  print("\n=== ДЕМОНСТРАЦИЯ СОБЛЮДЕНИЯ DIP (ИСПРАВЛЕННЫЙ КОД) ===\n");

  print("1. Создание сервиса конвертации:");
  final conversionService = FileConversionServiceFactory.createDefault();

  print("Доступные форматы: ${conversionService.getAvailableFormats()}");

  print("\n2. Использование через абстракцию:");
  conversionService.convertToPdf("document1.txt");
  conversionService.convertToDocx("document2.txt");

  print("\n3. Универсальный метод конвертации:");
  conversionService.convertTo("pdf", "report.txt");
  conversionService.convertTo("docx", "data.txt");

  print("\n4. Добавление нового конвертера без изменения существующего кода:");
  conversionService.registerConverter("jpg", JpgConverter());
  print("Теперь доступны форматы: ${conversionService.getAvailableFormats()}");
  conversionService.convertTo("jpg", "photo.png");

  print("\n5. Использование в клиентском коде (внедрение зависимостей):");
  final documentProcessor = DocumentProcessor(conversionService);
  documentProcessor.processDocument("annual_report.txt", "pdf");

  print("\n6. Пакетная обработка:");
  final documents = ["doc1.txt", "doc2.txt", "doc3.txt"];
  documentProcessor.processMultipleDocuments(documents, "docx");

  print("\n7. Создание сервиса с кастомными конвертерами:");
  final customConverters = [PdfConverter(), JpgConverter()];
  final customService = FileConversionServiceFactory.createWithCustomConverters(customConverters);
  print("Кастомный сервис поддерживает: ${customService.getAvailableFormats()}");
}

// ==================== 13. ДОПОЛНИТЕЛЬНАЯ ДЕМОНСТРАЦИЯ ГИБКОСТИ ====================
void demonstrateFlexibility() {
  print("\n=== ДЕМОНСТРАЦИЯ ГИБКОСТИ И ТЕСТИРУЕМОСТИ ===\n");

  print("1. Использование мок-конвертера для тестирования:");
  final mockConverter = MockConverter(); // Используем класс, определенный на верхнем уровне
  final testService = FileConversionServiceImpl();
  testService.registerConverter("test", mockConverter);
  testService.convertTo("test", "test_file.txt");
  testService.convertTo("test", "another_file.txt");
  print("Мок-конвертер был вызван ${mockConverter.callCount} раза");

  print("\n2. Замена реализации без изменения клиентского кода:");
  final fastService = FileConversionServiceImpl();
  fastService.registerConverter("pdf", FastPdfConverter()); // Используем класс с верхнего уровня
  fastService.convertTo("pdf", "large_document.txt");

  print("\n3. Работа с разными сервисами через общий интерфейс:");
  final services = <FileConversionService>[
    FileConversionServiceImpl(),
    FileConversionServiceFactory.createDefault(),
  ];

  for (var service in services) {
    print("Сервис типа ${service.runtimeType} поддерживает: ${service.getAvailableFormats()}");
  }
}

// ==================== 14. ОСНОВНАЯ ФУНКЦИЯ ====================
void main() {
  print("=== ПРИНЦИП ИНВЕРСИИ ЗАВИСИМОСТЕЙ (DIP) ===\n");

  // ШАГ 1: Показываем проблему исходного кода
  demonstrateOriginalProblem();

  print("\n" + "="*60 + "\n");

  // ШАГ 2: Показываем правильное решение
  demonstrateCorrectSolution();

  // ШАГ 3: Показываем преимущества и гибкость
  demonstrateFlexibility();

  print("\n" + "="*60);
  print("\nИТОГИ РЕФАКТОРИНГА:");
  print("✓ УСТРАНЕНЫ ПРОБЛЕМЫ ИСХОДНОГО КОДА:");
  print("  1. Устранена жесткая привязка к конкретным классам");
  print("  2. Появилась возможность легко расширять функциональность");
  print("  3. Улучшена тестируемость за счет использования моков");
  print("  4. Снижена связанность между компонентами");
  print("\n✓ РЕАЛИЗОВАНЫ ПРИНЦИПЫ DIP:");
  print("  1. Модули высокого уровня зависят от абстракций (интерфейсов)");
  print("  2. Модули низкого уровня реализуют эти абстракции");
  print("  3. Зависимости внедряются извне (Dependency Injection)");
  print("  4. Легкая замена реализаций без изменения клиентского кода");
}