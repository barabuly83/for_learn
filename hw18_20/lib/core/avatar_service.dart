import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'firebase_storage_service.dart';

class AvatarService {
  final FirebaseStorageService _storageService;
  final ImagePicker _imagePicker = ImagePicker();

  AvatarService(this._storageService);

  /// Выбор изображения из галереи
  Future<File?> pickImageFromGallery() async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      debugPrint('❌ Ошибка выбора изображения из галереи: $e');
      return null;
    }
  }

  /// Съемка фото с камеры
  Future<File?> takePhotoWithCamera() async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      debugPrint('❌ Ошибка съемки фото: $e');
      return null;
    }
  }

  /// Загрузка аватарки в Firebase Storage
  Future<String?> uploadAvatar({
    required File imageFile,
    required String userId,
  }) async {
    try {
      // Генерируем уникальное имя файла
      final fileName = 'avatar_${DateTime.now().millisecondsSinceEpoch}.jpg';

      final downloadUrl = await _storageService.uploadFile(
        filePath: imageFile.path,
        fileName: fileName,
        folder: 'avatars',
        userId: userId,
      );

      return downloadUrl;
    } catch (e) {
      debugPrint('❌ Ошибка загрузки аватарки: $e');
      return null;
    }
  }

  /// Удаление старой аватарки из Firebase Storage
  Future<bool> deleteOldAvatar(String avatarUrl) async {
    try {
      return await _storageService.deleteFile(avatarUrl);
    } catch (e) {
      debugPrint('❌ Ошибка удаления старой аватарки: $e');
      return false;
    }
  }

  /// Сохранение аватарки в локальное хранилище (кеш)
  Future<File?> saveAvatarToCache(File imageFile, String userId) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final avatarPath = path.join(directory.path, 'avatar_$userId.jpg');

      final savedFile = await imageFile.copy(avatarPath);
      debugPrint('✅ Аватарка сохранена в кэш: $avatarPath');
      return savedFile;
    } catch (e) {
      debugPrint('❌ Ошибка сохранения аватарки в кэш: $e');
      return null;
    }
  }

  /// Загрузка аватарки из кэша
  Future<File?> loadAvatarFromCache(String userId) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final avatarPath = path.join(directory.path, 'avatar_$userId.jpg');

      final file = File(avatarPath);
      if (await file.exists()) {
        return file;
      }
      return null;
    } catch (e) {
      debugPrint('❌ Ошибка загрузки аватарки из кэша: $e');
      return null;
    }
  }
}
