import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "vehicle_cost_list_short_dto.g.dart";

@JsonSerializable()
class VehicleCostListShortDto extends Equatable {
  const VehicleCostListShortDto({
    required this.id,
    required this.name,
    required this.price,
    this.vehicleId,
  });
  factory VehicleCostListShortDto.fromJson(final Map<String, dynamic> json) => _$VehicleCostListShortDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleCostListShortDtoToJson(this);

  final int id;
  final int? vehicleId;
  final String name;
  final double price;

  @override
  List<Object?> get props => [id, vehicleId, name, price];
}
