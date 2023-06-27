import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:amasyaapp/app/features/dashboard/features/hal_fiyatlari_list/data/hal_fiyatlari_usecase.dart';

import 'hal_fiyatlari_list_event.dart';
import 'hal_fiyatlari_list_state.dart';

@singleton
class HalFiyatlariListBloc extends Bloc<HalFiyatlariListEvent, HalFiyatlariListState> {
  HalFiyatlariListBloc(this._halFiyatlariListUseCase) : super(const HalFiyatlariListInitial()) {
    on<GetHalFiyatlariListEvent>((final event, final emit) async {
      emit(state.copyWith(isLoading: true));
/* 
      final garageId = getIt<AppBloc>().state.garage?.id;
      if (garageId == null) {
        emit(state.copyWith(isLoading: false));
        return;
      } */

      final result = await _halFiyatlariListUseCase.getHalFiyatlari();

      result.when(
        (final success) {
          emit(state.copyWith(halFiyatlariList: success, isLoading: false));
        },
        (final error) {
          emit(state.copyWith(isLoading: false));
        },
      );
    });
  }

  final HalFIyatlariListUseCase _halFiyatlariListUseCase;
}
