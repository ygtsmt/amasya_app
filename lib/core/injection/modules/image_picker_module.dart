import "package:image_picker/image_picker.dart";
import "package:injectable/injectable.dart";

@module
@singleton
abstract class ImagePickerModule {
  @injectable
  ImagePicker imagePicker() => ImagePicker();
}
