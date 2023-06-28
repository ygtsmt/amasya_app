import "package:amasyaapp/app/data/models/garage.dart";
import "package:amasyaapp/app/features/auth/features/create_garage/data/models/create_garage_request.dart";
import "package:amasyaapp/core/core.dart";
import "package:dio/dio.dart";
import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";

@injectable
class CreateGarageUseCase {
  const CreateGarageUseCase(this._snackBarService);

  Future<Result<Garage, String?>> createGarage(final CreateGarageRequest request) async {
    try {
      final result = await Dio().post("/api/Garage", data: request.toJson());

      return Result.success(Garage.fromJson(result.data as Map<String, dynamic>));
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }

  final SnackBarService _snackBarService;
}
