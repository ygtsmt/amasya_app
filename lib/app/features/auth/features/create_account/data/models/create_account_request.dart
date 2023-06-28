import "package:json_annotation/json_annotation.dart";

part "create_account_request.g.dart";

@JsonSerializable()
class CreateAccountRequest {
  const CreateAccountRequest({
    required this.email,
    required this.password,
    required this.name,
    required this.surname,
    this.phoneNumber,
    this.address,
    this.birthDate,
    this.inviteCode,
  });

  final String name;
  final String surname;
  final String email;
  final String password;
  final String? phoneNumber;
  final String? address;
  final DateTime? birthDate;
  final String? inviteCode;

  Map<String, dynamic> toJson() => _$CreateAccountRequestToJson(this);
}
