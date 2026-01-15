# Flutter Best Practices - Правила лучших практик

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

✅ **Стандартизированная структура проекта:**
```
lib/
├── main.dart              # Точка входа приложения
├── app.dart              # Корневой виджет приложения (MaterialApp/CupertinoApp)
├── pages/                # Экраны/страницы приложения
│   ├── home_page.dart
│   ├── about_page.dart
│   └── contacts_page.dart
├── widgets/              # Переиспользуемые виджеты
│   ├── app_button.dart
│   └── contact_card.dart
├── models/               # Модели данных
│   └── contact.dart
├── viewmodels/           # Бизнес-логика и состояние
│   └── contacts_viewmodel.dart
├── services/             # Сервисы (API, валидаторы и т.д.)
│   └── contact_service.dart
├── themes/               # Темы приложения
│   └── app_theme.dart
└── constants/            # Константы приложения
    └── app_constants.dart
```

**Правило:** Следуйте архитектуре MVVM:
- **Model** - данные и бизнес-сущности (папка `models/`)
- **View** - UI компоненты (папки `pages/` для экранов и `widgets/` для переиспользуемых виджетов)
- **ViewModel** - логика представления, состояние, обработка событий (папка `viewmodels/`)

**Дополнительные папки:**
- `services/` - для работы с внешними источниками (API, базы данных)
- `themes/` - для тем оформления приложения
- `constants/` - для констант и текстовых ресурсов

**Примечание:** Используйте `pages/` вместо `views/` для большей ясности. Название `pages` лучше отражает назначение - экраны/страницы приложения.

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

## 12. Стандартизация структуры папок и именования слоев

### Правила именования папок:

1. **pages/** - для экранов/страниц приложения
   - Используйте суффикс `_page.dart` (например: `home_page.dart`)
   - Каждая страница должна быть в отдельном файле
   - Название должно отражать функциональность (например: `login_page.dart`, `profile_page.dart`)

2. **widgets/** - для переиспользуемых виджетов
   - Используйте описательные названия (например: `app_button.dart`, `contact_card.dart`)
   - Виджеты должны быть максимально переиспользуемыми
   - Избегайте создания виджетов, которые используются только в одном месте

3. **models/** - для моделей данных
   - Названия в единственном числе (например: `contact.dart`, `user.dart`)
   - Модели должны быть immutable (использовать `final` поля и `const` конструкторы)
   - Реализуйте методы `toJson()`, `fromJson()`, `copyWith()`, `==` и `hashCode`

4. **viewmodels/** - для бизнес-логики и состояния
   - Используйте суффикс `_viewmodel.dart` (например: `contacts_viewmodel.dart`)
   - ViewModel не должен содержать UI логику
   - Должен зависеть от абстракций (интерфейсов), а не от конкретных реализаций

5. **services/** - для сервисов
   - Используйте суффикс `_service.dart` (например: `contact_service.dart`)
   - Сервисы должны выполнять одну конкретную задачу
   - Избегайте god-сервисов (сервисов, которые делают слишком много)

6. **themes/** - для тем приложения
   - Используйте суффикс `_theme.dart` (например: `app_theme.dart`)
   - Определяйте light и dark темы
   - Используйте константы для цветов, отступов, размеров шрифтов

7. **constants/** - для констант приложения
   - Используйте суффикс `_constants.dart` (например: `app_constants.dart`)
   - Группируйте константы по функциональности
   - Используйте `static const` для всех констант

### Правила создания папок:

1. **Создавайте папки только при необходимости** - не создавайте пустые папки "на будущее"
2. **Следуйте принципу YAGNI** (You Aren't Gonna Need It) - не создавайте структуру, которая не используется
3. **Добавляйте папки по мере роста проекта** - начинайте с минимальной структуры и расширяйте ее
4. **Поддерживайте консистентность** - используйте одинаковую структуру во всех проектах

### Пример минимальной структуры для нового проекта:

```
lib/
├── main.dart
├── app.dart
└── pages/
    └── home_page.dart
```

### Пример расширенной структуры для проекта среднего размера:

```
lib/
├── main.dart
├── app.dart
├── pages/
│   ├── home_page.dart
│   ├── login_page.dart
│   ├── profile_page.dart
│   └── settings_page.dart
├── widgets/
│   ├── app_button.dart
│   ├── text_field.dart
│   └── loading_indicator.dart
├── models/
│   ├── user.dart
│   └── settings.dart
├── viewmodels/
│   ├── auth_viewmodel.dart
│   └── settings_viewmodel.dart
├── services/
│   ├── auth_service.dart
│   └── api_service.dart
├── themes/
│   └── app_theme.dart
└── constants/
    └── app_constants.dart
```

---

## 13. Применение константных конструкторов во ViewModels и Services

❌ **НЕПРАВИЛЬНО:**
```dart
class ContactService {
  // Нет конструктора
  List<Contact> getContacts() { ... }
}

class ContactsViewModel {
  final ContactService contactService;
  
  ContactsViewModel(this.contactService); // ❌ Нет const конструктора
}
```

✅ **ПРАВИЛЬНО:**
```dart
class ContactService {
  const ContactService(); // ✅ Const конструктор
  
  List<Contact> getContacts() { ... }
}

class ContactsViewModel {
  final ContactService contactService;
  
  const ContactsViewModel({ContactService? contactService})
      : contactService = contactService ?? const ContactService(); // ✅ Const конструктор с dependency injection
}
```

**Правило:** 
- Все ViewModels и Services должны иметь const конструкторы
- Используйте dependency injection через параметры конструктора
- Предоставляйте значения по умолчанию для необязательных зависимостей
- Это улучшает тестируемость и соблюдение принципа Dependency Inversion

---

## 14. Разделение ответственности в MVVM

❌ **НЕПРАВИЛЬНО:**
```dart
// contacts_page.dart - смешивание UI и бизнес-логики
class ContactsPage extends StatelessWidget {
  final List<Contact> contacts = []; // ❌ Бизнес-логика в UI
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          title: Text(contact.name),
          subtitle: Text(contact.position),
        );
      },
    );
  }
}
```

✅ **ПРАВИЛЬНО:**
```dart
// contacts_viewmodel.dart - только бизнес-логика
class ContactsViewModel {
  final ContactService _contactService;
  
  const ContactsViewModel({ContactService? contactService})
      : _contactService = contactService ?? const ContactService();
  
  List<Contact> getContacts() {
    return _contactService.getContacts();
  }
}

// contacts_page.dart - только UI
class ContactsPage extends StatelessWidget {
  final ContactsViewModel viewModel;
  
  const ContactsPage({
    super.key,
    ContactsViewModel? viewModel,
  }) : viewModel = viewModel ?? const ContactsViewModel();
  
  @override
  Widget build(BuildContext context) {
    final contacts = viewModel.getContacts();
    
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          title: Text(contact.name),
          subtitle: Text(contact.position),
        );
      },
    );
  }
}
```

**Правило:** 
- **View (Pages/Widgets)** - только отображение UI, обработка пользовательского ввода
- **ViewModel** - бизнес-логика, состояние, преобразование данных для View
- **Model** - чистые данные, без логики
- **Service** - работа с внешними источниками (API, базы данных, файлы)
- Каждый слой должен зависеть только от слоя ниже (View → ViewModel → Service → Model)

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
- [ ] **Соблюдена стандартная структура папок (pages/, widgets/, models/, etc.)**
- [ ] **ViewModels и Services имеют const конструкторы**
- [ ] **Четкое разделение ответственности между слоями MVVM**
- [ ] **Используются dependency injection для зависимостей**
- [ ] **Константы вынесены в отдельные файлы в папке constants/**

## Преимущества стандартизированной структуры:

1. **Единообразие** - все проекты выглядят одинаково
2. **Быстрая onboarding** - новые разработчики быстро понимают структуру
3. **Легкая навигация** - знаешь где что искать
4. **Масштабируемость** - структура растет вместе с проектом
5. **Поддержка принципов SOLID** - каждый слой имеет четкую ответственность
6. **Улучшенная тестируемость** - легко mock-ить зависимости
7. **Переиспользуемость** - компоненты можно легко переносить между проектами

## Миграция со старой структуры на новую:

1. Создайте необходимые папки (`pages/`, `widgets/`, `models/`, etc.)
2. Переместите файлы в соответствующие папки
3. Обновите импорты во всех файлах
4. Добавьте const конструкторы к ViewModels и Services
5. Вынесите константы в `constants/` папку
6. Проверьте и обновите тесты
7. Запустите приложение и убедитесь, что все работает

**Помните:** Консистентность важнее перфекционизма. Начните с новой структуры в новых проектах, а существующие проекты мигрируйте постепенно по мере необходимости.

