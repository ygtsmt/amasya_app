import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "licence_plate_short_dto.g.dart";

@JsonSerializable()
class LicencePlateShortDto extends Equatable {
  const LicencePlateShortDto({
    required this.id,
    required this.plate,
    required this.garageId,
  });
  factory LicencePlateShortDto.fromJson(final Map<String, dynamic> json) => _$LicencePlateShortDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LicencePlateShortDtoToJson(this);

  final int id;
  final String plate;
  final int garageId;

  @override
  List<Object?> get props => [id, plate, garageId];
}
