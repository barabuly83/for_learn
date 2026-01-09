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

## 8. Разделение виджетов на отдельные файлы

❌ **НЕПРАВИЛЬНО:**
```dart
// main.dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { ... }

class TransitionAnimationScreen extends StatefulWidget { ... }
```

✅ **ПРАВИЛЬНО:**
```dart
// main.dart
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  runApp(const MyApp());
}

// app.dart
import 'package:flutter/material.dart';
import 'views/transition_animation_screen.dart';

class MyApp extends StatelessWidget { ... }

// views/transition_animation_screen.dart
import 'package:flutter/material.dart';

class TransitionAnimationScreen extends StatefulWidget { ... }
```

**Правило:** Каждый виджет должен находиться в отдельном файле. Это улучшает читаемость кода, упрощает навигацию и поддерживает принцип единственной ответственности. Структура проекта должна следовать архитектуре MVVM:
- `main.dart` - только точка входа приложения
- `app.dart` - корневой виджет приложения (MaterialApp/CupertinoApp)
- `views/` - страницы и экраны приложения
- `widgets/` - переиспользуемые виджеты

---

## 9. Создание структуры папок только при необходимости

❌ **НЕПРАВИЛЬНО:**
```
lib/
├── main.dart
├── app.dart
├── models/          # Пустая папка
├── viewmodels/      # Пустая папка
├── views/
│   └── home_screen.dart
├── widgets/         # Пустая папка
├── services/        # Пустая папка
└── constants/       # Пустая папка
```

✅ **ПРАВИЛЬНО:**
```
lib/
├── main.dart
├── app.dart
└── views/
    └── home_screen.dart
```

**Правило:** 
- Не создавайте пустые папки заранее "на будущее"
- Создавайте папки только когда в них появляются файлы
- Следуйте принципу YAGNI (You Aren't Gonna Need It) - не создавайте структуру, которая не используется
- Папки можно добавить позже, когда появятся соответствующие файлы (модели, виджеты, сервисы и т.д.)

---

## 10. Избегание избыточных комментариев

❌ **НЕПРАВИЛЬНО:**
```dart
class _MyWidgetState extends State<MyWidget> {
  // Индекс текущего видимого контейнера (0 или 1)
  int _currentIndex = 0;

  void _toggleContainers() {
    setState(() {
      // Переключаем между контейнерами
      _currentIndex = _currentIndex == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Комбинируем fade и scale анимации для плавного перехода
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(...),
    );
  }
}
```

✅ **ПРАВИЛЬНО:**
```dart
class _MyWidgetState extends State<MyWidget> {
  int _currentIndex = 0;

  void _toggleContainers() {
    setState(() {
      _currentIndex = _currentIndex == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(...),
    );
  }
}
```

**Правило:** 
- Удаляйте комментарии, которые дублируют код (описывают "что" делает код, а не "почему")
- Код должен быть самодокументированным через понятные имена переменных, функций и классов
- Оставляйте комментарии только для объяснения сложной бизнес-логики, неочевидных решений или предупреждений о потенциальных проблемах
- Комментарии должны объяснять "почему", а не "что"

---

## 11. Проверка тестов после изменений в lib

❌ **НЕПРАВИЛЬНО:**
```dart
// Изменили структуру проекта, переместили MyApp в app.dart
// Но забыли обновить тесты

// test/widget_test.dart
import 'package:task03/main.dart'; // ❌ Импорт устарел
```

✅ **ПРАВИЛЬНО:**
```dart
// После изменения структуры проекта обновили тесты

// test/widget_test.dart
import 'package:task03/app.dart'; // ✅ Импорт обновлен
```

**Правило:** 
- После любых изменений в файлах из папки `lib/` необходимо проверить и обновить соответствующие тесты в папке `test/`
- Особенно важно проверять тесты при:
  - Перемещении классов между файлами
  - Изменении структуры проекта
  - Переименовании классов или файлов
  - Изменении импортов
- Запускайте тесты после изменений: `flutter test`
- Убедитесь, что все тесты проходят успешно перед коммитом

---

## Чеклист перед коммитом

- [ ] Все интерфейсы названы без префикса `I`
- [ ] Нет методов, возвращающих виджеты (все вынесено в отдельные классы)
- [ ] Бизнес-логика не возвращает строки для UI
- [ ] Используются константные конструкторы где возможно
- [ ] Соблюдена архитектура MVVM
- [ ] Применены принципы SOLID
- [ ] Нет дублирования кода (DRY)
- [ ] Каждый виджет находится в отдельном файле
- [ ] Созданы только те папки, в которых есть файлы (нет пустых папок)
- [ ] Удалены избыточные комментарии, дублирующие код
- [ ] После изменений в `lib/` проверены и обновлены тесты в `test/`
- [ ] Все тесты проходят успешно (`flutter test`)

