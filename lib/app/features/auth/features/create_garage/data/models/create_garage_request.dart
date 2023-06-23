import "package:json_annotation/json_annotation.dart";

part "create_garage_request.g.dart";

@JsonSerializable()
class CreateGarageRequest {
  CreateGarageRequest({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.accountId,
  });

  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final int accountId;

  Map<String, dynamic> toJson() => _$CreateGarageRequestToJson(this);
}
