# Flutter Linter Configuration Based on Best Practices

Этот файл содержит конфигурацию линтера/анализатора для Flutter проектов, основанную на правилах из `FLUTTER_BEST_PRACTICES.md`.

## Файлы

1. **`analysis_options_template.yaml`** - основной файл конфигурации анализатора
2. **Этот README** - инструкция по использованию

## Как использовать

### Быстрый старт

1. Скопируйте `analysis_options_template.yaml` в корень вашего Flutter проекта:
   ```bash
   cp analysis_options_template.yaml your_flutter_project/analysis_options.yaml
   ```

2. Запустите анализ кода:
   ```bash
   cd your_flutter_project
   flutter analyze
   ```

3. Исправьте все ошибки (errors) и предупреждения (warnings)

### Интеграция в рабочий процесс

#### Для CI/CD (GitHub Actions):
```yaml
# .github/workflows/analyze.yml
name: Flutter Analyze

on: [push, pull_request]

jobs:
  analyze:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
      
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.x'
          
      - run: flutter pub get
      - run: flutter analyze
```

#### Для pre-commit хуков:
```bash
# .git/hooks/pre-commit
#!/bin/bash
echo "Running Flutter analyze..."
flutter analyze
if [ $? -ne 0 ]; then
  echo "Analysis failed. Please fix the issues before committing."
  exit 1
fi
```

## Какие правила проверяются

### 1. АРХИТЕКТУРНЫЕ ПРАВИЛА (самые важные)

**Из раздела 1 FLUTTER_BEST_PRACTICES.md:**
- ✅ **MVVM архитектура** - разделение на слои
- ✅ **SOLID принципы** - единая ответственность, инверсия зависимостей
- ✅ **DRY** - избегание повторения кода
- ✅ **Разделение бизнес-логики и UI** - ViewModels не возвращают строки

**Проверяемые правила:**
- `avoid_classes_with_only_static_members` - сервисы должны быть инстанциируемыми
- `avoid_void_async` - ViewModels должны возвращать типизированные результаты
- `prefer_single_constructor_per_file` - принцип единой ответственности

### 2. СТРУКТУРА ПРОЕКТА

**Из раздела 2 FLUTTER_BEST_PRACTICES.md:**
- ✅ **Стандартная структура папок** - pages/, widgets/, models/, viewmodels/, services/
- ✅ **Разделение виджетов на отдельные файлы**
- ✅ **Создание папок только при необходимости** (YAGNI)

**Проверяемые правила:**
- `directives_ordering` - единый порядок импортов
- `always_use_package_imports` - чистые импорты
- `file_names` - snake_case для файлов

### 3. ПРОЕКТИРОВАНИЕ ВИДЖЕТОВ (КРИТИЧЕСКИ ВАЖНО!)

**Из раздела 3 FLUTTER_BEST_PRACTICES.md:**
- ✅ **Избегание методов, возвращающих виджеты** - самая частая ошибка!
- ✅ **Создание отдельных классов-виджетов** вместо методов _buildSomething
- ✅ **Const конструкторы** для ViewModels и Services
- ✅ **Правильное именование интерфейсов** - без префикса I

**Проверяемые правила:**
- `prefer_const_constructors` - ОБЯЗАТЕЛЬНО для производительности
- `prefer_const_constructors_in_immutables` - для неизменяемых классов
- `use_key_in_widget_constructors` - для правильного lifecycle виджетов
- `no_logic_in_create_state` - бизнес-логика в ViewModel

### 4. СТИЛЬ КОДА

**Из раздела 4 FLUTTER_BEST_PRACTICES.md:**
- ✅ **Const конструкторы** где возможно
- ✅ **Избегание избыточных комментариев**
- ✅ **Проверка тестов после изменений**

**Проверяемые правила:**
- `prefer_final_fields` - final поля в моделях
- `prefer_final_locals` - final локальные переменные
- `unnecessary_const` - избегание лишних const
- `slash_for_doc_comments` - /// для документации

## Настройка под ваш проект

### Для более строгой проверки (рекомендуется):
```yaml
# В analysis_options.yaml измените:
analyzer:
  errors:
    prefer_const_constructors: error  # Было: error (оставить)
    prefer_final_fields: error        # Было: warning
    unnecessary_const: error          # Было: warning
```

### Для более мягкой проверки (для legacy кода):
```yaml
# В analysis_options.yaml измените:
analyzer:
  errors:
    prefer_const_constructors: warning  # Было: error
    non_constant_identifier_names: ignore  # Было: warning
    unnecessary_const: ignore           # Было: warning
```

## Решение常见 проблем

### 1. «Too many errors to fix»
```bash
# Временно отключите некоторые правила:
flutter analyze --no-fatal-infos

# Или анализируйте по частям:
flutter analyze lib/pages/    # Сначала страницы
flutter analyze lib/widgets/  # Потом виджеты
flutter analyze lib/viewmodels/ # Потом ViewModels
```

### 2. «Cannot find custom lint rules»
Кастомные правила в разделе `custom_lint` требуют установки пакета `custom_lint`. Для базовой проверки их можно закомментировать.

### 3. «Конфликт с другими правилами»
Если некоторые правила конфликтуют с вашим кодстайлом, отключите их:
```yaml
linter:
  rules:
    # - non_constant_identifier_names  # Закомментировать чтобы отключить
    # - constant_identifier_names      # Закомментировать чтобы отключить
```

## Полный чеклист перед коммитом

Перед коммитом убедитесь, что:

1. ✅ `flutter analyze` не показывает ошибок
2. ✅ `flutter test` проходит все тесты
3. ✅ Все ViewModels и Services имеют const конструкторы
4. ✅ Нет методов, возвращающих виджеты (только отдельные классы)
5. ✅ Бизнес-логика не возвращает строки для UI
6. ✅ Соблюдена структура папок (pages/, widgets/, models/, etc.)
7. ✅ Используются dependency injection для зависимостей
8. ✅ Константы вынесены в constants/

## Преимущества использования

1. **Единообразие** - весь код в проекте следует одним правилам
2. **Автоматическая проверка** - не нужно делать кодревью для базовых правил
3. **Раннее обнаружение проблем** - ошибки архитектуры обнаруживаются сразу
4. **Обучение новых разработчиков** - линтер «учит» best practices
5. **Улучшение производительности** - const конструкторы и правильная композиция виджетов

## Миграция существующего проекта

1. **Поэтапный подход:**
   ```bash
   # 1. Сначала только критические ошибки
   flutter analyze --no-fatal-warnings --no-fatal-infos
   
   # 2. Исправьте все errors
   # 3. Затем исправьте warnings
   # 4. Наконец, исправьте infos
   ```

2. **Используйте `// ignore:` комментарии для legacy кода:**
   ```dart
   // ignore: prefer_const_constructors
   Widget build(BuildContext context) {
     return Container(color: Colors.red);  // Старый код
   }
   ```

3. **Планируйте рефакторинг сложных мест**

## Дополнительные ресурсы

- [Официальная документация Dart анализатора](https://dart.dev/guides/language/analysis-options)
- [Flutter Lints package](https://pub.dev/packages/flutter_lints)
- [Effective Dart](https://dart.dev/effective-dart)

## Лицензия

Эти файлы можно свободно использовать и модифицировать в любых Flutter проектах.

---

**Помните:** Консистентность важнее перфекционизма. Начните с новых проектов, а существующие мигрируйте постепенно.
