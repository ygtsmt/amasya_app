import "package:image_picker/image_picker.dart";
import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_photo/data/models/vehicle_photo_dto.dart";
import "package:revogarageapp/core/core.dart";
import "package:revogarageapp/core/services/image_picker_service.dart";

@injectable
class VehiclePhotoUseCase {
  VehiclePhotoUseCase(this._httpDataSource, this._snackBarService, this._imagePickerService);

  Future<Result<List<VehiclePhotoDto>, String?>> getVehiclePhotos(final int vehicleId) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.get,
        "/api/VehiclePhoto?vehicleId=$vehicleId",
      );

      final vehiclePhotoDtos = (response.data as List)
          .map((final image) => VehiclePhotoDto.fromJson(image as Map<String, dynamic>))
          .toList();

      return Result.success(vehiclePhotoDtos);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<List<VehiclePhotoDto>, String?>> addVehiclePhoto(final XFile file, final int vehicleId) async {
    try {
      final photo = await _imagePickerService.filetoBase64(file);

      final vehiclePhotoDto = VehiclePhotoDto(
        base64: photo.base64,
        id: 0,
        name: photo.name,
        vehicleId: vehicleId,
      );

      await _httpDataSource.request(
        RequestMethod.post,
        "/api/VehiclePhoto",
        data: vehiclePhotoDto.toJson(),
      );

      final getPhotoResult = await getVehiclePhotos(vehicleId);
      return Result.success(getPhotoResult.tryGetSuccess() ?? []);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<List<VehiclePhotoDto>, String?>> deleteVehiclePhoto(
    final int vehiclePhotoId,
    final int vehicleId,
  ) async {
    try {
      await _httpDataSource.request(
        RequestMethod.delete,
        "/api/VehiclePhoto?Id=$vehiclePhotoId",
      );

      final getPhotoResult = await getVehiclePhotos(vehicleId);
      return Result.success(getPhotoResult.tryGetSuccess() ?? []);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int, String?>> setDefaultPhoto(final int vehiclePhotoId) async {
    try {
      await _httpDataSource.request(
        RequestMethod.patch,
        "/api/VehiclePhoto/SetDefaultVehiclePhoto",
        data: {"Id": vehiclePhotoId},
      );

      return Result.success(vehiclePhotoId);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  final HttpDataSource _httpDataSource;
  final SnackBarService _snackBarService;
  final ImagePickerService _imagePickerService;
}
