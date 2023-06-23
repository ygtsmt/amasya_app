import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "employee_list_short_dto.g.dart";

@JsonSerializable()
class EmployeeListShortDto extends Equatable {
  const EmployeeListShortDto({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.refreshTokenEndDate,
    required this.type,
    required this.garageId,
    required this.passwordChangeOn,
    required this.fullName,
  });
  factory EmployeeListShortDto.fromJson(final Map<String, dynamic> json) => _$EmployeeListShortDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeListShortDtoToJson(this);

  final int id;
  final String name;
  final String surname;
  final String email;
  final DateTime? refreshTokenEndDate;
  final int type;
  final int garageId;
  final DateTime? passwordChangeOn;
  final String fullName;

  @override
  List<Object?> get props =>
      [id, name, surname, email, refreshTokenEndDate, type, garageId, passwordChangeOn, fullName];
}
