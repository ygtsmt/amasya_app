import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "customer_dto.g.dart";

@JsonSerializable()
class CustomerDto extends Equatable {
  const CustomerDto({
    required this.id,
    required this.name,
    required this.surname,
    required this.acceptSms,
    required this.acceptEmail,
    this.birthDate,
    this.email,
    this.phoneNumber,
    this.address,
    this.licenceNumber,
    this.profilePhotoName,
    this.profilePhotoBase64,
  });

  factory CustomerDto.fromJson(final Map<String, dynamic> json) => _$CustomerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDtoToJson(this);

  final int id;
  final String name;
  final String surname;
  final DateTime? birthDate;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final String? licenceNumber;
  final bool acceptSms;
  final bool acceptEmail;
  final String? profilePhotoName;
  final String? profilePhotoBase64;

  @override
  List<Object?> get props => [
        id,
        name,
        surname,
        birthDate,
        email,
        phoneNumber,
        address,
        licenceNumber,
        acceptSms,
        acceptEmail,
        profilePhotoName,
        profilePhotoBase64,
      ];
}
