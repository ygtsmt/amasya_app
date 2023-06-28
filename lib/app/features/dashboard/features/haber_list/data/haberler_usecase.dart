import "package:dio/dio.dart";
import "package:injectable/injectable.dart";
import "package:multiple_result/multiple_result.dart";
import 'package:amasyaapp/app/features/dashboard/features/haber_list/data/models/haber_model.dart';
import "package:amasyaapp/core/core.dart";

@injectable

class HaberListUseCase {
  HaberListUseCase(this._snackBarService);

  final SnackBarService _snackBarService;

  Future<Result<List<HaberModelDto>?, String?>> getHabers() async {
    try {
      final result = await Dio().get("https://amasya.bel.tr/api/haberler");
              final data = result.data as List<dynamic>;

   final haberler = data
            .map((haber) => HaberModelDto.fromJson(haber as Map<String, dynamic>))
            .toList();


      return Result.success(haberler);
    } catch (e) {
      final errorMessage = e.getHttpErrorMessage();
      _snackBarService.showSnackBar(errorMessage);
      return Result.error(errorMessage);
    }
  }
}
 