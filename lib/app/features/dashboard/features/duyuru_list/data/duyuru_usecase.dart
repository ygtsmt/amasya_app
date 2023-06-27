import "package:dio/dio.dart";
import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import "package:amasyaapp/app/features/dashboard/features/duyuru_list/data/models/duyuru_model.dart";
import "package:amasyaapp/core/core.dart";

@injectable

class DuyuruListUseCase {
  DuyuruListUseCase(this._snackBarService);

  final SnackBarService _snackBarService;

  Future<Result<List<DuyuruModelDto>?, String?>> getDuyurular() async {
    try {
      final result = await Dio().get("https://amasya.bel.tr/api/duyurular");
              final data = result.data as List<dynamic>;

   final duyurular = data
            .map((duyuru) => DuyuruModelDto.fromJson(duyuru as Map<String, dynamic>))
            .toList();


      return Result.success(duyurular);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }
}
 