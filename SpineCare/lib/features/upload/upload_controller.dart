import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UploadController {
  final ImagePicker _picker = ImagePicker();

  File? selectedImage;

  /// 📸 فتح الكاميرا
  Future<File?> pickFromCamera() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
    );

    if (image == null) return null;

    selectedImage = File(image.path);
    return selectedImage;
  }

  /// 🖼️ فتح الاستوديو (Gallery)
  Future<File?> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image == null) return null;

    selectedImage = File(image.path);
    return selectedImage;
  }

  /// 🔬 تحليل الصورة (Mock – Firebase لاحقًا)
  Future<void> analyzeImage() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
