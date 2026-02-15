import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class AvatarService {
  final ImagePicker _imagePicker = ImagePicker();

  AvatarService();

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

  /// Сохранение аватарки локально
  Future<String?> saveAvatarLocally({
    required File imageFile,
    required String userId,
  }) async {
    try {
      debugPrint(
        '💾 AvatarService: Starting local avatar save for user: $userId',
      );

      // Сохраняем изображение в локальном хранилище
      final savedFile = await saveAvatarToLocalStorage(imageFile, userId);

      if (savedFile != null) {
        debugPrint('✅ AvatarService: Avatar saved locally: ${savedFile.path}');
        return savedFile.path;
      } else {
        debugPrint('❌ AvatarService: Avatar save returned null');
        return null;
      }
    } catch (e) {
      debugPrint('❌ Ошибка сохранения аватарки локально: $e');
      return null;
    }
  }

  /// Сохранение аватарки в локальное хранилище
  Future<File?> saveAvatarToLocalStorage(File imageFile, String userId) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final avatarPath = path.join(directory.path, 'avatar_$userId.jpg');

      final savedFile = await imageFile.copy(avatarPath);
      debugPrint('✅ Аватарка сохранена локально: $avatarPath');
      return savedFile;
    } catch (e) {
      debugPrint('❌ Ошибка сохранения аватарки локально: $e');
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
