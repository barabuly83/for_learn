import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

/// Интерфейс сервиса хранения файлов
abstract class StorageService {
  /// Загрузить файл в Storage
  Future<String> uploadFile(String path, File file);

  /// Загрузить байты в Storage
  Future<String> uploadBytes(String path, Uint8List bytes);

  /// Получить URL файла
  Future<String> getDownloadUrl(String path);

  /// Удалить файл
  Future<void> deleteFile(String path);

  /// Проверить существование файла
  Future<bool> fileExists(String path);
}

/// Реализация сервиса хранения файлов
class StorageServiceImpl implements StorageService {
  final FirebaseStorage _storage;

  StorageServiceImpl({required FirebaseStorage storage}) : _storage = storage;

  @override
  Future<String> uploadFile(String path, File file) async {
    try {
      final ref = _storage.ref().child(path);
      final uploadTask = ref.putFile(file);

      // Ждем завершения загрузки с таймаутом
      final taskSnapshot = await uploadTask.timeout(
        const Duration(seconds: 60),
        onTimeout: () {
          uploadTask.cancel();
          throw Exception('Upload timeout after 60 seconds');
        },
      );

      // Проверяем, что загрузка успешна
      if (taskSnapshot.state == TaskState.success) {
        // Используем ref из taskSnapshot для получения URL с таймаутом
        return await taskSnapshot.ref.getDownloadURL().timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw Exception('Failed to get download URL: timeout');
          },
        );
      } else {
        throw Exception('Upload failed with state: ${taskSnapshot.state}');
      }
    } on FirebaseException catch (e) {
      throw Exception('Failed to upload file: ${e.code} - ${e.message}');
    } catch (e) {
      throw Exception('Failed to upload file: $e');
    }
  }

  @override
  Future<String> uploadBytes(String path, Uint8List bytes) async {
    try {
      final ref = _storage.ref().child(path);
      final uploadTask = ref.putData(
        bytes,
        SettableMetadata(contentType: 'text/plain'),
      );

      // Ждем завершения загрузки с таймаутом
      final taskSnapshot = await uploadTask.timeout(
        const Duration(seconds: 30),
        onTimeout: () async {
          // Проверяем состояние перед отменой
          if (uploadTask.snapshot.state == TaskState.running) {
            try {
              await uploadTask.cancel();
            } catch (e) {
              // print('Warning: Failed to cancel upload task: $e');
            }
          }
          throw Exception('Upload timeout after 30 seconds');
        },
      );

      // Проверяем, что загрузка успешна
      if (taskSnapshot.state == TaskState.success) {
        // Используем ref из taskSnapshot для получения URL с таймаутом
        try {
          return await taskSnapshot.ref.getDownloadURL().timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              throw Exception('Failed to get download URL: timeout');
            },
          );
        } on FirebaseException catch (e) {
          // Если не удалось получить URL сразу после загрузки, пробуем через небольшую задержку
          if (e.code == 'object-not-found') {
            await Future<void>.delayed(const Duration(milliseconds: 500));
            return await taskSnapshot.ref.getDownloadURL().timeout(
              const Duration(seconds: 10),
              onTimeout: () {
                throw Exception(
                  'Failed to get download URL: timeout after retry',
                );
              },
            );
          }
          rethrow;
        }
      } else {
        throw Exception('Upload failed with state: ${taskSnapshot.state}');
      }
    } on FirebaseException catch (e) {
      throw Exception('Failed to upload bytes: ${e.code} - ${e.message}');
    } catch (e) {
      throw Exception('Failed to upload bytes: $e');
    }
  }

  @override
  Future<String> getDownloadUrl(String path) async {
    try {
      final ref = _storage.ref().child(path);
      return await ref.getDownloadURL();
    } catch (e) {
      throw Exception('Failed to get download URL: $e');
    }
  }

  @override
  Future<void> deleteFile(String path) async {
    try {
      final ref = _storage.ref().child(path);
      await ref.delete();
    } catch (e) {
      throw Exception('Failed to delete file: $e');
    }
  }

  @override
  Future<bool> fileExists(String path) async {
    try {
      final ref = _storage.ref().child(path);
      await ref.getDownloadURL();
      return true;
    } catch (e) {
      return false;
    }
  }
}
