import "package:json_annotation/json_annotation.dart";

part "account.g.dart";

@JsonSerializable()
class Account {
  const Account({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    this.garageId,
  });
  factory Account.fromJson(final Map<String, dynamic> json) => _$AccountFromJson(json);
  final int id;
  final String name;
  final String surname;
  final String email;
  final int? garageId;
}
