#!/bin/bash

echo "🔥 Запуск Firebase эмуляторов..."

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

echo "📍 Запуск Firestore и Storage эмуляторов..."
echo "📍 Firestore: http://localhost:8080"
echo "📍 Storage: http://localhost:9199"
echo "🎛️ UI: http://localhost:4000"
echo ""
echo "⚠️ Не закрывайте это окно! Эмуляторы должны работать."
echo "В новом терминале запустите: flutter run"
echo ""

firebase emulators:start --only firestore,storage