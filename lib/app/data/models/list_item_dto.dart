import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "list_item_dto.g.dart";

@JsonSerializable()
class ListItemDto extends Equatable {
  const ListItemDto({
    required this.id,
    required this.name,
  });
  factory ListItemDto.fromJson(final Map<String, dynamic> json) => _$ListItemDtoFromJson(json);

  final int id;
  final String name;

  Map<String, dynamic> toJson() => _$ListItemDtoToJson(this);

  @override
  List<Object> get props => [id, name];
}
