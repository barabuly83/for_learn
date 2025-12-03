// ==================== 1. Класс валидации ====================
// Отвечает только за валидацию данных пользователя
// Причина изменения: если поменяются правила валидации
class UserValidator {
  void validate(Map<String, dynamic> userData) {
    // Проверка имени
    if (userData['name'] == null || userData['name'].isEmpty) {
      throw Exception('Имя пользователя не может быть пустым');
    }

    // Проверка возраста
    if (userData['age'] == null || userData['age'] < 0) {
      throw Exception('Возраст пользователя не может быть отрицательным');
    }
  }
}

// ==================== 2. Класс обработки данных ====================
// Отвечает только за преобразование/обработку данных
// Причина изменения: если изменится логика обработки данных
class UserDataProcessor {
  Map<String, dynamic> process(Map<String, dynamic> userData) {
    // Создаем копию данных, чтобы не изменять оригинал
    final processedData = Map<String, dynamic>.from(userData);

    // Преобразуем имя в верхний регистр
    processedData['name'] = processedData['name'].toString().toUpperCase();

    // Увеличиваем возраст на 1 (если это требуется по бизнес-логике)
    processedData['age'] = (processedData['age'] as int) + 1;

    return processedData;
  }
}

// ==================== 3. Класс сохранения данных ====================
// Отвечает только за сохранение данных
// Причина изменения: если изменится способ сохранения (БД, файл, API и т.д.)
class UserRepository {
  void save(Map<String, dynamic> userData) {
    // Здесь может быть код для сохранения в базу данных, файл или отправка по API
    print('Данные сохранены: $userData');

    // В реальном приложении здесь была бы логика:
    // - Подключение к БД
    // - SQL запросы
    // - Обработка транзакций
    // - и т.д.
  }
}

// ==================== 4. Класс логирования ====================
// Отвечает только за логирование операций
// Причина изменения: если изменится формат/место логов (файл, консоль, система мониторинга)
class Logger {
  void logInfo(String message) {
    print('[INFO] ${DateTime.now()}: $message');
  }

  void logError(String message) {
    print('[ERROR] ${DateTime.now()}: $message');
  }
}

// ==================== 5. Основной сервис ====================
// Координирует работу всех компонентов, но не выполняет их задачи напрямую
// Причина изменения: если изменится порядок или состав операций над пользователем
class UserService {
  final UserValidator _validator;
  final UserDataProcessor _processor;
  final UserRepository _repository;
  final Logger _logger;

  // Внедрение зависимостей через конструктор
  // Это делает класс более гибким и тестируемым
  UserService({
    required UserValidator validator,
    required UserDataProcessor processor,
    required UserRepository repository,
    required Logger logger,
  })  : _validator = validator,
        _processor = processor,
        _repository = repository,
        _logger = logger;

  // Основной метод обработки пользователя
  void processUser(Map<String, dynamic> userData) {
    try {
      _logger.logInfo('Начало обработки пользователя: $userData');

      // 1. Валидация (отдельная ответственность)
      _validator.validate(userData);
      _logger.logInfo('Валидация пройдена успешно');

      // 2. Обработка данных (отдельная ответственность)
      final processedData = _processor.process(userData);
      _logger.logInfo('Данные обработаны: $processedData');

      // 3. Сохранение (отдельная ответственность)
      _repository.save(processedData);
      _logger.logInfo('Данные сохранены успешно');

      _logger.logInfo('Обработка пользователя завершена успешно');

    } catch (e) {
      // Логирование ошибок (отдельная ответственность)
      _logger.logError('Ошибка при обработке пользователя: $e');
      rethrow; // Пробрасываем исключение дальше
    }
  }
}

// ==================== 6. Дополнительный класс для расширенной логики ====================
// Демонстрация расширяемости: можно легко добавить новую функциональность
// без изменения существующих классов
class EmailNotifier {
  void sendWelcomeEmail(String userName, String email) {
    print('Отправка приветственного письма пользователю $userName на email $email');
  }
}

// ==================== 7. Фасад для упрощения использования ====================
// Опционально: можно создать фасад для упрощения создания сервиса
class UserServiceFactory {
  static UserService createDefault() {
    return UserService(
      validator: UserValidator(),
      processor: UserDataProcessor(),
      repository: UserRepository(),
      logger: Logger(),
    );
  }

  static UserService createWithEmailNotification() {
    final service = createDefault();
    // Здесь можно добавить дополнительную настройку
    return service;
  }
}

// ==================== Основная функция ====================
void main() {
  print('=== Пример 1: Использование с фабрикой ===');
  try {
    final userService = UserServiceFactory.createDefault();
    userService.processUser({'name': 'Alice', 'age': 25});
  } catch (e) {
    print('Ошибка: $e');
  }

  print('\n=== Пример 2: Ручное создание сервиса ===');
  try {
    // Создаем сервис вручную (полезно для тестирования с моками)
    final userService = UserService(
      validator: UserValidator(),
      processor: UserDataProcessor(),
      repository: UserRepository(),
      logger: Logger(),
    );
    userService.processUser({'name': 'Bob', 'age': 30});
  } catch (e) {
    print('Ошибка: $e');
  }

  print('\n=== Пример 3: Обработка ошибки ===');
  try {
    final userService = UserServiceFactory.createDefault();
    // Попытка обработать некорректные данные
    userService.processUser({'name': '', 'age': -5});
  } catch (e) {
    print('Ошибка перехвачена в main: $e');
  }
}

// ==================== 8. Пример теста (для демонстрации) ====================
// Этот код демонстрирует, как теперь легко тестировать каждый компонент отдельно
/*
class MockUserRepository extends UserRepository {
  Map<String, dynamic>? savedData;

  @override
  void save(Map<String, dynamic> userData) {
    savedData = userData; // Сохраняем для проверки в тестах
  }
}

void testUserService() {
  final mockRepository = MockUserRepository();
  final service = UserService(
    validator: UserValidator(),
    processor: UserDataProcessor(),
    repository: mockRepository,
    logger: Logger(),
  );

  service.processUser({'name': 'Test', 'age': 20});

  // Проверяем, что данные были сохранены
  assert(mockRepository.savedData != null);
  assert(mockRepository.savedData!['name'] == 'TEST');
  assert(mockRepository.savedData!['age'] == 21);

  print('Тест пройден!');
}
*/