
import 'package:equatable/equatable.dart';
import 'package:revogarageapp/app/features/dashboard/features/duyuru_list/data/models/duyuru_model.dart';
import 'package:revogarageapp/app/features/dashboard/features/hal_fiyatlari_list/data/models/hal_fiyatlari_model.dart';

class HalFiyatlariListState extends Equatable {
  const HalFiyatlariListState({
    required this.isLoading,
    required this.halFiyatlariList,
  });

  final bool isLoading;
  final List<HalFiyatlariModelDto> halFiyatlariList;

  HalFiyatlariListState copyWith({
    final bool? isLoading,
    final List<HalFiyatlariModelDto>? halFiyatlariList,
  }) {
    return HalFiyatlariListState(
      isLoading: isLoading ?? this.isLoading,
      halFiyatlariList: halFiyatlariList ?? this.halFiyatlariList,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        halFiyatlariList,
      ];
}

class HalFiyatlariListInitial extends HalFiyatlariListState {
  const HalFiyatlariListInitial()
      : super(
          isLoading: false,
          halFiyatlariList: const [],
        );
}
 