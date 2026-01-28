# hw13_15

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

### Getting QuizAPI Key

To avoid rate limiting issues, it's **strongly recommended** to use your own API key:

1. **Register** at [https://quizapi.io/register](https://quizapi.io/register)
2. **Login** and go to [https://quizapi.io/clientarea/settings/token](https://quizapi.io/clientarea/settings/token)
3. **Copy** your API key
4. Use it when running the app (see below)

API keys are **free** for development, open-source, and non-commercial use.

### Running the Application

#### Basic Run (Uses Default Key - Not Recommended)
```bash
flutter run
```
⚠️ **Warning:** The default key may be rate-limited due to shared usage.

#### With Your QuizAPI Key (Recommended)
```bash
flutter run --dart-define=QUIZ_API_KEY=your_api_key_here
```

#### With Firebase Emulators
```bash
flutter run --dart-define=USE_STORAGE_EMULATOR=true
```

#### With Both Emulators and API Key
```bash
flutter run \
  --dart-define=USE_STORAGE_EMULATOR=true \
  --dart-define=QUIZ_API_KEY=your_api_key_here
```

**Note:** Always use your own API key to avoid rate limiting issues. The default key is shared and may be blocked or limited.

### Configuration

The app supports the following environment variables via `--dart-define`:

- `QUIZ_API_KEY` - Your QuizAPI.io API key (recommended to set)
- `USE_STORAGE_EMULATOR` - Enable Firebase Storage emulator
- `USE_FIRESTORE_EMULATOR` - Enable Firestore emulator

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.