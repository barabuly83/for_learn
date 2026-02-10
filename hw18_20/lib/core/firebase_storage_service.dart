import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Подключение к Firebase Storage эмулятору (только для разработки)
  Future<void> connectToEmulator() async {
    if (kDebugMode) {
      try {
        // Для Android эмулятора используем специальный адрес
        const String emulatorHost = bool.hasEnvironment('ANDROID_EMULATOR')
            ? '10.0.2.2'
            : 'localhost';

        await _storage.useStorageEmulator(emulatorHost, 9199);
        print('✅ Подключено к Firebase Storage эмулятору ($emulatorHost:9199)');
      } catch (e) {
        print('❌ Ошибка подключения к эмулятору: $e');
      }
    }
  }

  /// Загрузка файла в Firebase Storage
  Future<String?> uploadFile({
    required String filePath,
    required String fileName,
    required String folder,
    required String userId,
  }) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        throw Exception('Файл не найден: $filePath');
      }

      final storageRef = _storage.ref();
      final fileRef = storageRef.child('$folder/$userId/$fileName');

      final uploadTask = await fileRef.putFile(file);
      final downloadUrl = await uploadTask.ref.getDownloadURL();

      print('✅ Файл загружен: $downloadUrl');
      return downloadUrl;
    } catch (e) {
      print('❌ Ошибка загрузки файла: $e');
      return null;
    }
  }

  /// Скачивание файла из Firebase Storage
  Future<File?> downloadFile({
    required String downloadUrl,
    required String localPath,
  }) async {
    try {
      final file = File(localPath);
      await _storage.refFromURL(downloadUrl).writeToFile(file);
      print('✅ Файл скачан: $localPath');
      return file;
    } catch (e) {
      print('❌ Ошибка скачивания файла: $e');
      return null;
    }
  }

  /// Удаление файла из Firebase Storage
  Future<bool> deleteFile(String fileUrl) async {
    try {
      await _storage.refFromURL(fileUrl).delete();
      print('✅ Файл удалён: $fileUrl');
      return true;
    } catch (e) {
      print('❌ Ошибка удаления файла: $e');
      return false;
    }
  }

  /// Получение списка файлов пользователя
  Future<List<String>> listUserFiles({
    required String folder,
    required String userId,
  }) async {
    try {
      final storageRef = _storage.ref().child('$folder/$userId');
      final result = await storageRef.listAll();

      final urls = <String>[];
      for (final item in result.items) {
        final url = await item.getDownloadURL();
        urls.add(url);
      }

      return urls;
    } catch (e) {
      print('❌ Ошибка получения списка файлов: $e');
      return [];
    }
  }
}
