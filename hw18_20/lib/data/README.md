# Data Layer (Слой данных)

## Описание

Слой данных служит для абстрагирования источников данных и предоставления их в виде, пригодном для использования доменным слоем. Он скрывает детали реализации (например, работу с базой данных или API) и обеспечивает единообразный доступ к данным через репозитории.

## Архитектура

```
Data Layer
├── datasources/          # Источники данных (абстракции и реализации)
│   ├── remote/          # Удаленные источники (API)
│   └── local/           # Локальные источники (кэш, БД)
├── models/              # Модели данных (DTO)
└── repositories/        # Реализации репозиториев доменного слоя
```

## Компоненты

### 1. Data Sources (Источники данных)

#### Remote Data Sources (Удаленные источники)

- **`AuthRemoteDataSource`** - Абстракция для работы с Firebase Auth
  - `AuthRemoteDataSourceImpl` - Реализация с Firebase

- **`UserRemoteDataSource`** - Абстракция для работы с User API
  - `UserRemoteDataSourceImpl` - Реализация с Firebase

#### Local Data Sources (Локальные источники)

- **`UserLocalDataSource`** - Абстракция для локального хранения пользователей
  - `UserLocalDataSourceImpl` - Реализация (in-memory для демонстрации, в реальном приложении - Hive)

### 2. Models (Модели данных)

Модели данных преобразуют данные из внешних источников (JSON, БД) в доменные сущности:

- **`UserModel`** - Модель пользователя с методами `fromJson`, `toJson`, `toEntity`, `fromEntity`

### 3. Repositories (Репозитории)

Реализации репозиториев из доменного слоя, которые координируют работу между удаленными и локальными источниками:

- **`UserRepositoryImpl`** - Реализует `UserRepository`
  - Использует `UserRemoteDataSource` для работы с API
  - Использует `UserLocalDataSource` для кэширования
  - Реализует стратегию cache-first с фоновым обновлением

## Принципы работы

### 1. Абстракция источников данных

Каждый источник данных имеет абстрактный интерфейс, который скрывает детали реализации:

```dart
abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}
```

Это позволяет легко заменить реализацию (например, с mock на реальный HTTP-клиент) без изменения кода, который использует этот источник.

### 2. Единообразный доступ через репозитории

Реализации репозиториев предоставляют единый интерфейс для доменного слоя, скрывая сложность работы с несколькими источниками данных:

```dart
class UserRepositoryImpl implements UserRepository {
  // Координирует работу между remote и local источниками
  // Предоставляет единый интерфейс для domain layer
}
```

### 3. Кэширование данных

Реализована стратегия cache-first:
1. Сначала проверяется локальный кэш
2. Если данных нет в кэше, запрос идет к удаленному источнику
3. Полученные данные сохраняются в кэш для будущего использования

### 4. Обработка ошибок

При ошибках удаленного источника система пытается вернуть данные из кэша, обеспечивая отказоустойчивость.

## Примеры использования

### User Repository

```dart
final userRepo = UserRepositoryImpl(
  remoteDataSource: UserRemoteDataSourceImpl(),
  localDataSource: UserLocalDataSourceImpl(),
);

// Получение пользователей (сначала из кэша, затем из API)
final result = await userRepo.getUsers();
```

## Интеграция с реальными сервисами

### Firebase Auth

В реальном приложении `AuthRemoteDataSourceImpl` будет использовать Firebase:

```dart
final auth = FirebaseAuth.instance;
final userCredential = await auth.signInWithEmailAndPassword(
  email: email,
  password: password,
);
return UserModel.fromFirebaseUser(userCredential.user!);
```

### Hive Storage

В реальном приложении `UserLocalDataSourceImpl` будет использовать Hive:

```dart
final box = await Hive.openBox<UserModel>('users');
await box.putAll(Map.fromEntries(users.map((u) => MapEntry(u.id, u))));
```

## Зависимости

Слой данных зависит от:
- **Domain Layer** - использует интерфейсы репозиториев и сущности
- **Core Layer** - использует типы ошибок (`Failure`)

Слой данных НЕ зависит от:
- **Presentation Layer** - изоляция от UI
- Конкретных реализаций внешних библиотек (HTTP, Firebase, Hive) - все скрыто за абстракциями
