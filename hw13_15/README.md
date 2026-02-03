# hw13_15

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

### Environment Setup

To run this application, you need to configure both environment variables and Firebase:

#### 1. QuizAPI Configuration

1. **Create a `.env` file** in the root directory of the project
2. **Add your QuizAPI key** (required - no default value):
   ```
   QUIZ_API_KEY=your_api_key_here
   ```

##### Getting QuizAPI Key

1. **Register** at [https://quizapi.io/register](https://quizapi.io/register)
2. **Login** and go to [https://quizapi.io/clientarea/settings/token](https://quizapi.io/clientarea/settings/token)
3. **Copy** your API key
4. **Paste** it into your `.env` file

API keys are **free** for development, open-source, and non-commercial use.

**Important:** The application will not work without a valid API key in the `.env` file.

#### 2. Firebase Configuration

1. **Install FlutterFire CLI** (if not already installed):
   ```bash
   dart pub global activate flutterfire_cli
   ```

2. **Login to Firebase** (if not already logged in):
   ```bash
   firebase login
   ```

3. **Configure Firebase for your project**:
   ```bash
   flutterfire configure --project your-project-id --platforms android,ios,macos,web,windows
   ```
   This will create:
   - `lib/firebase_options.dart` with your Firebase project configuration
   - `android/app/google-services.json` for Android
   - `ios/Runner/GoogleService-Info.plist` for iOS
   - `macos/Runner/GoogleService-Info.plist` for macOS

4. **Or manually configure each platform**:
   - Copy `lib/firebase_options_template.dart` to `lib/firebase_options.dart`
   - Copy `android/app/google-services-template.json` to `android/app/google-services.json`
   - Copy `ios/Runner/GoogleService-Info-template.plist` to `ios/Runner/GoogleService-Info.plist`
   - Copy `macos/Runner/GoogleService-Info-template.plist` to `macos/Runner/GoogleService-Info.plist`
   - Replace placeholder values with your Firebase project settings from Firebase Console (Project Settings > General > Your apps)

### Running the Application

```bash
flutter run
```

#### With Firebase Emulators

```bash
flutter run \
  --dart-define=USE_STORAGE_EMULATOR=true \
  --dart-define=USE_FIRESTORE_EMULATOR=true
```

### Configuration

The app supports the following environment variables:

- `QUIZ_API_KEY` - Your QuizAPI.io API key (**required** - set in `.env` file)
- `USE_STORAGE_EMULATOR` - Enable Firebase Storage emulator
- `USE_FIRESTORE_EMULATOR` - Enable Firestore emulator

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.