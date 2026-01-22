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
      await ref.putFile(file);
      return await ref.getDownloadURL();
    } catch (e) {
      throw Exception('Failed to upload file: $e');
    }
  }

  @override
  Future<String> uploadBytes(String path, Uint8List bytes) async {
    try {
      final ref = _storage.ref().child(path);
      await ref.putData(bytes);
      return await ref.getDownloadURL();
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