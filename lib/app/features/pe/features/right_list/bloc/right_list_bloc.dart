import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/pe/features/right_list/data/models/right_list_short_dto.dart";
import "package:revogarageapp/app/features/pe/features/right_list/data/right_list_usecase.dart";
import "package:revogarageapp/core/injection/injection.dart";

part "right_list_event.dart";
part "right_list_state.dart";

@singleton
class RightListBloc extends Bloc<RightListEvent, RightListState> {
  RightListBloc(this._rightListUseCase) : super(const RightListInitial()) {
    on<GetRightListEvent>((final event, final emit) async {
      emit(state.copyWith(isLoading: true));

      final garageId = getIt<AppBloc>().state.garage?.id;
      if (garageId == null) {
        emit(state.copyWith(isLoading: false));
        return;
      }

      final result = await _rightListUseCase.getRights(garageId);

      result.when(
        (final success) {
          emit(state.copyWith(rightList: success, isLoading: false));
        },
        (final error) {
          emit(state.copyWith(isLoading: false));
        },
      );
    });

    on<SearchRightListEvent>(
      (final event, final emit) {
        final filtredRights =
            state.rightList.where((final rights) => rights.name.toLowerCase().contains(event.searchText.toLowerCase()));
        emit(state.copyWith(rightList: filtredRights.toList()));
      },
    );
  }

  final RightListUseCase _rightListUseCase;
}
