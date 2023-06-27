import "package:dio/dio.dart";
import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:amasyaapp/app/features/dashboard/features/hal_fiyatlari_list/data/models/hal_fiyatlari_model.dart";
import "package:amasyaapp/core/core.dart";

@injectable
class HalFIyatlariListUseCase {
  HalFIyatlariListUseCase(this._snackBarService);

  final SnackBarService _snackBarService;

  Future<Result<List<HalFiyatlariModelDto>?, String?>> getHalFiyatlari() async {
    try {
      final result = await Dio().get("https://amasya.bel.tr/api/hal-fiyarlari");
      final data = result.data as List<dynamic>;

      final halFiyatlari =
          data.map((halFiyat) => HalFiyatlariModelDto.fromJson(halFiyat as Map<String, dynamic>)).toList();

      return Result.success(halFiyatlari);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }
}
