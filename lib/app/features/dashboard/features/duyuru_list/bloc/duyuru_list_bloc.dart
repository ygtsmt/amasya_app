


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:amasyaapp/app/features/dashboard/features/duyuru_list/data/duyuru_usecase.dart';

import 'duyuru_list_event.dart';
import 'duyuru_list_state.dart';


@singleton
class DuyuruListBloc extends Bloc<DuyuruListEvent, DuyuruListState> {
  DuyuruListBloc(this._duyuruListUseCase) : super(const DuyuruListInitial()) {
    on<GetDuyuruListEvent>((final event, final emit) async {
      emit(state.copyWith(isLoading: true));
/* 
      final garageId = getIt<AppBloc>().state.garage?.id;
      if (garageId == null) {
        emit(state.copyWith(isLoading: false));
        return;
      } */

      final result = await _duyuruListUseCase.getDuyurular();

      result.when(
        (final success) {
          emit(state.copyWith(duyuruList: success, isLoading: false));
        },
        (final error) {
          emit(state.copyWith(isLoading: false));
        },
      );
    });
  }

  final DuyuruListUseCase _duyuruListUseCase;
}
