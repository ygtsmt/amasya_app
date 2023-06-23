import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "sms_template_list_short_dto.g.dart";

@JsonSerializable()
class SmsTemplateListShortDto extends Equatable {
  const SmsTemplateListShortDto({
    required this.id,
    required this.name,
    required this.text,
    required this.garageId,
  });
  factory SmsTemplateListShortDto.fromJson(final Map<String, dynamic> json) => _$SmsTemplateListShortDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SmsTemplateListShortDtoToJson(this);

  final int id;
  final String name;
  final String text;
  final int garageId;

  @override
  List<Object?> get props => [id, name, text, garageId];
}
