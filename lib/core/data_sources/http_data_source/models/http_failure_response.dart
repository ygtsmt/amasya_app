import "package:json_annotation/json_annotation.dart";

part "http_failure_response.g.dart";

@JsonSerializable()
class HttpFailureResponse {
  const HttpFailureResponse({
    required this.status,
    // required this.errorMessage,
    this.errors,
  });

  factory HttpFailureResponse.fromJson(final Map<String, dynamic> json) => _$HttpFailureResponseFromJson(json);

  // @JsonKey(name: "title")
  // final String errorMessage;

  final int status;

  final Map<String, List<String>?>? errors;

  String? get errorMessage => "${errors?.entries.first.key} ${errors?.entries.first.value?[0]}";
}
