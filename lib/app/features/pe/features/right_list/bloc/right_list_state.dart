part of "right_list_bloc.dart";

class RightListState extends Equatable {
  const RightListState({
    required this.isLoading,
    required this.rightList,
  });

  final bool isLoading;
  final List<RightListShortDto> rightList;

  RightListState copyWith({
    final bool? isLoading,
    final List<RightListShortDto>? rightList,
  }) {
    return RightListState(
      isLoading: isLoading ?? this.isLoading,
      rightList: rightList ?? this.rightList,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        rightList,
      ];
}

class RightListInitial extends RightListState {
  const RightListInitial()
      : super(
          isLoading: false,
          rightList: const [],
        );
}
