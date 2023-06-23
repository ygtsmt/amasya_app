import "package:json_annotation/json_annotation.dart";

part "employee.g.dart";

@JsonSerializable()
class Employee {
  const Employee({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.type,
    required this.phoneNumber,
    required this.address,
    this.garageId,
  });
  factory Employee.fromJson(final Map<String, dynamic> json) => _$EmployeeFromJson(json);
  final int id;
  final String name;
  final String surname;
  final String email;
  final int? garageId;
  final int type;
  final String phoneNumber;
  final String address;
}
