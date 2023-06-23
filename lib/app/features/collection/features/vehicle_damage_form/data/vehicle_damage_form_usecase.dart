import "package:image_picker/image_picker.dart";
import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/data/models/damage_photo_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/data/models/vehicle_damage_list_short_dto.dart";
import "package:revogarageapp/core/data_sources/http_data_source/http_data_source.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/extensions.dart";
import "package:revogarageapp/core/services/image_picker_service.dart";
import "package:revogarageapp/core/services/snackbar_service.dart";

@injectable
class VehicleDamageFormUseCase {
  VehicleDamageFormUseCase(this._httpDataSource, this._snackBarService, this._imagePickerService);

  Future<Result<int, String?>> createDamages(
    final int vehicleId,
    final String name,
    final String? description,
    final double price,
    final List<DamagePhotoDto>? photos,
  ) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.post,
        "/api/VehicleDamage/CreateVehicleDamageWithPhotos",
        data: {
          "vehicleId": vehicleId,
          "name": name,
          "text": description,
          "price": price,
          "damagePhotos": [...?photos?.map((final e) => e.toJson())]
        },
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int, String?>> updateDamages(final VehicleDamageListShortDto damageListShortDto) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.patch,
        "/api/VehicleDamage",
        data: damageListShortDto.toJson(),
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int?, String?>> deleteDamages(final int damageId) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.delete,
        "/api/VehicleDamage?Id=$damageId",
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int, String?>> addDamagePhoto(
    final int damageId,
    final XFile file,
  ) async {
    try {
      final base64 = await _imagePickerService.filetoBase64(file);
      final response = await _httpDataSource.request(
        RequestMethod.post,
        "/api/VehicleDamage/CreatePhoto",
        data: {
          "name": base64.name,
          "base64": base64.base64,
          "vehicleDamageId": damageId,
        },
      );

      return Result.success(response.data as int);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  Future<Result<int, String?>> deleteDamagePhoto(final int damagePhotoId) async {
    try {
      final response = await _httpDataSource.request(
        RequestMethod.delete,
        "/api/VehicleDamage/DeletePhoto?Id=$damagePhotoId",
      );

      return Result.success(response.data as int);
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
