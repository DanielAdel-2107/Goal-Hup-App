import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  static final ImagePicker _picker = ImagePicker();

  static Future<XFile?> pickImage({required ImageSource source}) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      return XFile(image.path);
    }
    return null;
  }
}
