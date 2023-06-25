
import 'package:equatable/equatable.dart';
import 'package:revogarageapp/app/features/dashboard/features/haber_list/data/models/haber_model.dart';

class HaberListState extends Equatable {
  const HaberListState({
    required this.isLoading,
    required this.haberList,
  });

  final bool isLoading;
  final List<HaberModelDto> haberList;

  HaberListState copyWith({
    final bool? isLoading,
    final List<HaberModelDto>? haberList,
  }) {
    return HaberListState(
      isLoading: isLoading ?? this.isLoading,
      haberList: haberList ?? this.haberList,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        haberList,
      ];
}

class HaberListInitial extends HaberListState {
  const HaberListInitial()
      : super(
          isLoading: false,
          haberList: const [],
        );
}
 