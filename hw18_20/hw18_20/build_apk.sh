#!/bin/bash

echo "🚀 Начинаем сборку APK для hw18_20..."

# Проверяем наличие Flutter
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter не установлен. Установите Flutter SDK:"
    echo "   https://flutter.dev/docs/get-started/install"
    exit 1
fi

echo "✅ Flutter найден: $(flutter --version)"

# Устанавливаем зависимости
echo "📦 Устанавливаем зависимости..."
flutter pub get

if [ $? -ne 0 ]; then
    echo "❌ Ошибка при установке зависимостей"
    exit 1
fi

# Проверяем, что Android SDK настроен
echo "🔧 Проверяем Android SDK..."
if [ -z "$ANDROID_SDK_ROOT" ] && [ -z "$ANDROID_HOME" ]; then
    echo "⚠️  ANDROID_SDK_ROOT или ANDROID_HOME не установлены"
    echo "   Убедитесь, что Android SDK установлен и переменные окружения настроены"
fi

# Собираем APK
echo "🏗️  Собираем релизную версию APK..."
flutter build apk --release

if [ $? -eq 0 ]; then
    echo "✅ APK успешно собран!"
    echo "📱 APK находится в: build/app/outputs/flutter-apk/app-release.apk"

    # Показываем информацию о файле
    if [ -f "build/app/outputs/flutter-apk/app-release.apk" ]; then
        ls -lh build/app/outputs/flutter-apk/app-release.apk
        echo ""
        echo "📋 Инструкции по установке:"
        echo "1. Перенесите APK файл на Android устройство"
        echo "2. Включите 'Установку из неизвестных источников' в настройках"
        echo "3. Установите APK файл"
        echo "4. Запустите приложение!"
    fi
else
    echo "❌ Ошибка при сборке APK"
    exit 1
fi