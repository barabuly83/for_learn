# Flutter Best Practices - Правила лучших практик

Этот документ содержит правила и рекомендации по разработке на Flutter, которые применяются во всех проектах репозитория.

## 1. Именование интерфейсов

❌ **НЕПРАВИЛЬНО:**
```dart
class IEmailValidator {
  String? validate(String? email);
}

class EmailValidatorImpl implements IEmailValidator { ... }
```

✅ **ПРАВИЛЬНО:**
```dart
abstract class EmailValidator {
  ValidationError? validate(String? email);
}

class DefaultEmailValidator implements EmailValidator { ... }
```

**Правило:** При именовании интерфейсов не рекомендуется добавлять префикс `I`. Имя должно отражать роль или поведение, а не тип. Реализации должны иметь описательные имена (например, `DefaultEmailValidator`, а не `EmailValidatorImpl`).

---

## 2. Избегание методов, возвращающих виджеты

❌ **НЕПРАВИЛЬНО:**
```dart
class MyWidget extends StatelessWidget {
  Widget _buildButton({required String text}) {
    return ElevatedButton(...);
  }
  
  @override
  Widget build(BuildContext context) {
    return _buildButton(text: 'Click');
  }
}
```

✅ **ПРАВИЛЬНО:**
```dart
class MyButton extends StatelessWidget {
  final String text;
  
  const MyButton({super.key, required this.text});
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(...);
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyButton(text: 'Click');
  }
}
```

**Правило:** Во Flutter разработке избегайте выделения части UI в отдельные методы, которые возвращают виджет. Вместо этого следует выносить их в отдельные классы-виджеты (обычно `StatelessWidget`).

---

## 3. Разделение бизнес-логики и UI

❌ **НЕПРАВИЛЬНО:**
```dart
class LoginViewModel {
  Future<String> login(String email, String password) async {
    // ...
    return 'Вход выполнен успешно!'; // Строка из бизнес-логики
  }
}
```

✅ **ПРАВИЛЬНО:**
```dart
// Бизнес-логика возвращает типизированные ошибки
class LoginViewModel {
  Future<LoginResult> login(String email, String password) async {
    // ...
    return LoginResult.success();
  }
}

// UI слой преобразует ошибки в текст
class ErrorMessageService {
  static String? getMessage(LoginResult result) {
    switch (result.status) {
      case LoginStatus.success:
        return 'Вход выполнен успешно!';
      // ...
    }
  }
}
```

**Правило:** 
- Бизнес-логика не должна возвращать строки с сообщениями для пользователя
- Бизнес-логика должна возвращать типизированные объекты (enum, классы-результаты)
- Преобразование ошибок/результатов в текст - это зона ответственности UI слоя
- Это позволяет легко добавить мультиязычность без изменения бизнес-логики

---

## 4. Использование константных конструкторов

❌ **НЕПРАВИЛЬНО:**
```dart
class LoginCredentials {
  final String email;
  final String password;
  
  LoginCredentials({required this.email, required this.password});
}
```

✅ **ПРАВИЛЬНО:**
```dart
class LoginCredentials {
  final String email;
  final String password;
  
  const LoginCredentials({
    required this.email,
    required this.password,
  });
}
```

**Правило:** Используйте константные конструкторы (`const`) у классов, где это возможно. Это улучшает производительность и позволяет создавать константные экземпляры.

**Применяется к:**
- Моделям данных с `final` полями
- `StatelessWidget` виджетам
- Любым immutable классам

---

## 5. Архитектура MVVM

✅ **Структура проекта:**
```
lib/
├── models/          # Модели данных
├── viewmodels/      # Бизнес-логика и состояние
├── views/           # UI компоненты (страницы)
├── widgets/         # Переиспользуемые виджеты
├── services/        # Сервисы (валидаторы, API и т.д.)
└── constants/       # Константы приложения
```

**Правило:** Следуйте архитектуре MVVM:
- **Model** - данные и бизнес-сущности
- **View** - UI компоненты (виджеты, страницы)
- **ViewModel** - логика представления, состояние, обработка событий

---

## 6. Принципы SOLID

✅ **Применяемые принципы:**

- **Single Responsibility** - каждый класс отвечает за одну задачу
- **Open/Closed** - открыт для расширения, закрыт для модификации (интерфейсы)
- **Liskov Substitution** - реализации могут заменять интерфейсы
- **Interface Segregation** - много маленьких интерфейсов лучше одного большого
- **Dependency Inversion** - зависимость от абстракций, а не от конкретных классов

---

## 7. DRY (Don't Repeat Yourself)

✅ **Правила:**
- Выносите повторяющийся код в переиспользуемые виджеты
- Используйте константы вместо магических чисел
- Создавайте утилитные классы для общей логики

---

## Чеклист перед коммитом

- [ ] Все интерфейсы названы без префикса `I`
- [ ] Нет методов, возвращающих виджеты (все вынесено в отдельные классы)
- [ ] Бизнес-логика не возвращает строки для UI
- [ ] Используются константные конструкторы где возможно
- [ ] Соблюдена архитектура MVVM
- [ ] Применены принципы SOLID
- [ ] Нет дублирования кода (DRY)

