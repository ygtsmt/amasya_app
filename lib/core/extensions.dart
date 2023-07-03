import "dart:convert";

import "package:dio/dio.dart";
import "package:image_picker/image_picker.dart";
import "package:amasyaapp/core/data_sources/http_data_source/models/http_failure_response.dart";
import "package:amasyaapp/core/enums.dart";
import "package:amasyaapp/core/utils.dart";

extension RequestMethodX on RequestMethod {
  String get value => getEnumValue(this).toUpperCase();
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension GetErrorMessage on Object {
  String getHttpErrorMessage() {
    String? errorMessage;
    // ignore: deprecated_member_use
    if (this is DioError) {
      // ignore: deprecated_member_use
      final dioError = this as DioError;

      if (dioError.response?.statusCode != 401) {
        final httpError = HttpFailureResponse.fromJson(dioError.response?.data as Map<String, dynamic>);

        errorMessage = httpError.errorMessage;
      }
    }
    return errorMessage ?? "AppLocalizations.current.common_error";
  }
}

extension ToBase64 on XFile {
  Future<String> toBase64() async {
    final bytes = await readAsBytes();
    return base64Encode(bytes);
  }
}
