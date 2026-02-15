import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

/// Service for handling Firebase Storage operations
class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Upload a file to Firebase Storage
  /// Returns the download URL of the uploaded file
  Future<String> uploadFile({
    required String path,
    required File file,
    required String fileName,
  }) async {
    try {
      final ref = _storage.ref().child(path).child(fileName);
      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload file: $e');
    }
  }

  /// Delete a file from Firebase Storage
  Future<void> deleteFile(String path) async {
    try {
      final ref = _storage.ref().child(path);
      await ref.delete();
    } catch (e) {
      throw Exception('Failed to delete file: $e');
    }
  }

  /// Get download URL for a file
  Future<String> getDownloadUrl(String path) async {
    try {
      final ref = _storage.ref().child(path);
      return await ref.getDownloadURL();
    } catch (e) {
      throw Exception('Failed to get download URL: $e');
    }
  }
}
