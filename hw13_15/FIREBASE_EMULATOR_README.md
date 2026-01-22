# Firebase Emulator Setup

## 🚀 Запуск с Firebase эмуляторами

### Предварительные требования:
1. Установлен Firebase CLI: `npm install -g firebase-tools`
2. Запущены эмуляторы:
   ```bash
   firebase emulators:start --only auth,storage
   ```

### Конфигурация эмулятора:
- **Firebase Storage**: `127.0.0.1:9199`
- **Bucket**: `demo-project.appspot.com`
- **Web UI**: http://127.0.0.1:4000

### Запуск приложения:
```bash
# С Storage эмулятором (Auth работает с реальным Firebase)
flutter run --dart-define=USE_STORAGE_EMULATOR=true

# Без эмуляторов (production)
flutter run
```

## 🧪 Тестирование Storage

### В приложении доступны функции тестирования:

1. **Загрузить тест** - загружает текстовый файл в Storage
2. **Проверить файлы** - показывает список загруженных файлов
3. **Загрузить изображение** - выбирает фото из галереи и загружает

### Структура файлов в Storage:
```
demo-project.appspot.com/
├── test/{userId}/
│   ├── test_file_{timestamp}.txt
│   └── ...
└── images/{userId}/
    ├── profile_{timestamp}.jpg
    └── ...
```

## 🔧 Настройка для Production

### 1. Firebase Console Setup:
- Перейдите в [Firebase Console](https://console.firebase.google.com)
- Выберите ваш проект
- **Authentication**: Включите Email/Password и Google провайдеры
- **Storage**: Создайте bucket и настройте правила безопасности

### 2. Storage Rules (firestore.rules):
```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

### 3. Запуск без эмуляторов:
```bash
flutter run
```

## 📱 Разрешения

### Android (уже настроено):
- `android.permission.CAMERA`
- `android.permission.READ_EXTERNAL_STORAGE`
- `android.permission.WRITE_EXTERNAL_STORAGE`

### iOS:
Добавьте в `ios/Runner/Info.plist`:
```xml
<key>NSCameraUsageDescription</key>
<string>Для загрузки фото профиля</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Для выбора фото из галереи</string>
```</content>
</xai:function_call



Firebase Storage Emulator:
https://shell.cloud.google.com/?hl=en&theme=dark&authuser=0&fromcloudshell=true&show=terminal

Сохранил в cloudshell

# Самый минимум - только 2 файла
cd ~/firebase-emulator
cp firebase.json storage.rules ~/
echo "✅ Конфигурация сохранена в корневой директории"

ПОСЛЕ ПЕРЕЗАПУСКА (восстанавливаем):

# В новом Cloud Shell
mkdir -p ~/firebase-emulator
cp ~/firebase.json ~/storage.rules ~/firebase-emulator/
cd ~/firebase-emulator
firebase emulators:start --only storage --project demo-project

РЕЗУЛЬТАТ:
Хост: 127.0.0.1:9199
Bucket: demo-project.appspot.com
Web UI: http://127.0.0.1:4000