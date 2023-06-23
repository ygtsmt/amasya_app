import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "right_list_short_dto.g.dart";

@JsonSerializable()
class RightListShortDto extends Equatable {
  const RightListShortDto({
    required this.id,
    required this.name,
    required this.text,
    required this.garageId,
  });
  factory RightListShortDto.fromJson(final Map<String, dynamic> json) => _$RightListShortDtoFromJson(json);

   Map<String, dynamic> toJson() => _$RightListShortDtoToJson(this);

  final int id;
  final String name;
  final String text;
  final int garageId; 

  
  @override
  List<Object?> get props => [id, name, text, garageId];
}
