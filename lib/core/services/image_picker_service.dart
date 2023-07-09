import "dart:convert";

import "package:image_picker/image_picker.dart";
import "package:injectable/injectable.dart";

@injectable
class ImagePickerService {
  ImagePickerService(this._picker);

  final ImagePicker _picker;

  Future<List<XFile>> pickMultiImage() async {
    final images = await _picker.pickMultiImage(
      imageQuality: 25,
      maxHeight: 800,
      maxWidth: 1200,
    );

    return images;
  }

  Future<XFile?> takePhoto() async {
    final image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 25,
      maxHeight: 800,
      maxWidth: 1200,
    );

    return image;
  }


}
