import "package:json_annotation/json_annotation.dart";

part "fuel_type.g.dart";

@JsonSerializable()
class FuelType {
  const FuelType({
    required this.id,
    required this.name,
  });

  factory FuelType.fromJson(final Map<String, dynamic> json) => _$FuelTypeFromJson(json);

  final int id;
  final String name;

  Map<String, dynamic> toJson() => _$FuelTypeToJson(this);
}
