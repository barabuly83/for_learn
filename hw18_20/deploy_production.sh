#!/bin/bash

echo "🚀 Развертывание в Firebase Production..."

# Проверка наличия Firebase CLI
if ! command -v firebase &> /dev/null; then
    echo "❌ Firebase CLI не установлен."
    echo "Установите: npm install -g firebase-tools"
    exit 1
fi

# Проверка авторизации
if ! firebase projects:list &> /dev/null 2>&1; then
    echo "❌ Вы не авторизованы в Firebase."
    echo "Выполните: firebase login"
    exit 1
fi

echo "📋 Выбор проекта..."
firebase use hw18-20

echo "📋 Развертывание Firestore правил..."
firebase deploy --only firestore:rules

echo "📋 Развертывание Storage правил..."
firebase deploy --only storage

echo "✅ Развертывание в production завершено!"
echo ""
echo "🎉 Теперь приложение будет работать с production Firestore!"
echo "📍 Данные будут сохраняться в облачной базе данных"
echo "🔄 Перезапустите приложение: flutter run"