# Data Layer (Слой данных)

## Описание

Слой данных отвечает за работу с внешними источниками данных (Firebase). После рефакторинга архитектура была упрощена - удален сложный слой доменных сущностей и репозиториев для пользователей, поскольку Firebase Auth предоставляет достаточный функционал для аутентификации.

## Архитектура

```
Data Layer
├── datasources/          # Источники данных (абстракции и реализации)
│   └── remote/          # Удаленные источники (Firebase)
├── models/              # Модели данных (DTO)
└── repositories/        # Реализации репозиториев (только для задач)
```

## Компоненты

### 1. Data Sources (Источники данных)

#### Remote Data Sources (Удаленные источники)

- **`AuthRemoteDataSource`** - Абстракция для работы с Firebase Auth
  - `AuthRemoteDataSourceImpl` - Реализация с Firebase
  - Методы: signIn, signUp, signOut, getCurrentUser, changePassword, resetPassword

- **`TodoRemoteDataSource`** - Абстракция для работы с Firestore (задачи)
  - `TodoRemoteDataSourceImpl` - Реализация с Firestore

### 2. Models (Модели данных)

Модели данных преобразуют данные из внешних источников в формат, пригодный для использования:

- **`TodoItemModel`** - Модель задачи с методами `fromJson`, `toJson`, `toEntity`, `fromEntity`

### 3. Repositories (Репозитории)

- **`TodoRepositoryImpl`** - Реализует `TodoRepository`
  - Использует только `TodoRemoteDataSource` (Firestore)
  - Firestore предоставляет встроенное офлайн-кэширование
  - Упрощенная архитектура без локального кэширования

## Принципы работы

### 1. Упрощенная архитектура

После рефакторинга была применена упрощенная архитектура:

- **Убрана** сложная иерархия пользовательских сущностей (UserModel → User entity)
- **Firebase Auth** используется напрямую вместо кастомных репозиториев
- **Удалено** локальное кэширование пользователей (избыточно при Firebase)
- **Сохранено** репозиторий для задач с использованием Firestore

### 2. Firebase-first подход

```dart
// Прямое использование Firebase Auth вместо репозиториев
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      // Auth state обновляется автоматически через listener
    } on firebase_auth.FirebaseAuthException catch (e) {
      emit(AuthError(_getAuthErrorMessage(e)));
    }
  }
}
```

### 3. Кэширование

Для задач используется встроенное кэширование Firestore:
- Firestore SDK автоматически кэширует данные
- Поддержка офлайн-режима без дополнительного кода
- Синхронизация при восстановлении соединения

### 4. Обработка ошибок

Простая обработка ошибок через Either<Failure, T> паттерн.

## Примеры использования

### Auth Remote Data Source

```dart
final authDataSource = AuthRemoteDataSourceImpl();

// Прямая работа с Firebase Auth
final userCredential = await authDataSource.signInWithEmailAndPassword(
  email, password
);
```

### Todo Repository

```dart
final todoRepo = TodoRepositoryImpl(remoteDataSource: TodoRemoteDataSourceImpl());

// Firestore с встроенным кэшированием
final result = await todoRepo.getTodos(userId);
```

## Интеграция с Firebase

### Firebase Auth

Упрощенная интеграция без промежуточных моделей:

```dart
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;

  @override
  Future<firebase_auth.UserCredential> signInWithEmailAndPassword(
    String email, String password,
  ) async {
    return await _auth.signInWithEmailAndPassword(
      email: email, password: password,
    );
  }
}
```

### Firestore

Прямая работа с коллекциями без локального кэширования:

```dart
final todosRef = FirebaseFirestore.instance.collection('todos');
final snapshot = await todosRef.where('userId', isEqualTo: userId).get();
```

## Зависимости

Слой данных зависит от:
- **Domain Layer** - интерфейсы репозиториев для задач
- **Core Layer** - типы ошибок (`Failure`)

Слой данных НЕ зависит от:
- **Presentation Layer** - полная изоляция от UI
- Сложные пользовательские сущности (упрощено до Firebase User)
