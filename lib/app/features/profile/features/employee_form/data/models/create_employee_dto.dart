import "package:json_annotation/json_annotation.dart";

part "create_employee_dto.g.dart";

@JsonSerializable()
class CreateEmployeeDto {
  const CreateEmployeeDto({
    required this.email,
    required this.password,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.address,
    required this.birthDate,
    required this.type,
    required this.garageId,
    this.inviteCode,
    this.id,
  });
  final int? id;
  final String name;
  final String surname;
  final String email;
  final String password;
  final String phoneNumber;
  final String address;
  final DateTime birthDate;
  final String? inviteCode;
  final int type;
  final int garageId;
  Map<String, dynamic> toJson() => _$CreateEmployeeDtoToJson(this);
}
