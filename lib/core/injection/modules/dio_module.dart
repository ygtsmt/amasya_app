import "package:dio/dio.dart";
import "package:injectable/injectable.dart";

@module
@singleton
abstract class DioModule {
  @singleton
  Dio dio() => Dio();
}
