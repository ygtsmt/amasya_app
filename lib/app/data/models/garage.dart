import "package:json_annotation/json_annotation.dart";

part "garage.g.dart";

@JsonSerializable()
class Garage {
  Garage({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.billingType,
  });
  factory Garage.fromJson(final Map<String, dynamic> json) => _$GarageFromJson(json);

  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final int billingType;
}
