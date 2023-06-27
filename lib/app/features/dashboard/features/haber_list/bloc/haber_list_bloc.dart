


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:amasyaapp/app/features/dashboard/features/haber_list/data/haberler_usecase.dart';

import 'haber_list_event.dart';
import 'haber_list_state.dart';


@singleton
class HaberListBloc extends Bloc<HaberListEvent, HaberListState> {
  HaberListBloc(this._haberListUseCase) : super(const HaberListInitial()) {
    on<GetHaberListEvent>((final event, final emit) async {
      emit(state.copyWith(isLoading: true));
/* 
      final garageId = getIt<AppBloc>().state.garage?.id;
      if (garageId == null) {
        emit(state.copyWith(isLoading: false));
        return;
      } */

      final result = await _haberListUseCase.getHabers();

      result.when(
        (final success) {
          emit(state.copyWith(haberList: success, isLoading: false));
        },
        (final error) {
          emit(state.copyWith(isLoading: false));
        },
      );
    });
  }

  final HaberListUseCase _haberListUseCase;
}
