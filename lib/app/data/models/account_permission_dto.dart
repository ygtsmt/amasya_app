import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "account_permission_dto.g.dart";

@JsonSerializable()
class AccountPermissionDto extends Equatable {
  const AccountPermissionDto({
    this.id,
    this.name,
    this.valueText,
    this.enDate,
  });
  factory AccountPermissionDto.fromJson(final Map<String, dynamic> json) => _$AccountPermissionDtoFromJson(json);

  final int? id;
  final String? name;
  final String? valueText;
  final DateTime? enDate;

  @override
  List<Object?> get props => [id, name, valueText, enDate];
}
