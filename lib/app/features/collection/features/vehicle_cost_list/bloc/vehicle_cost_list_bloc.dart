import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_list/data/models/vehicle_cost_list_short_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_list/data/vehicle_cost_list_usecase.dart";
import "package:revogarageapp/core/injection/injection.dart";

part "vehicle_cost_list_event.dart";
part "vehicle_cost_list_state.dart";

@singleton
class VehicleCostListBloc extends Bloc<VehicleCostListEvent, VehicleCostListState> {
  VehicleCostListBloc(this._vehicleCostListUseCase) : super(const VehicleCostListInitial()) {
    on<GetVehicleCostListEvent>((final event, final emit) async {
      emit(state.copyWith(isLoading: true));

      final garageId = getIt<AppBloc>().state.garage?.id;
      if (garageId == null) {
        emit(state.copyWith(isLoading: false));
        return;
      }

      final result = await _vehicleCostListUseCase.getVehicleCosts(event.vehicleId);

      result.when(
        (final success) {
          emit(state.copyWith(vehicleCostList: success, isLoading: false));
        },
        (final error) {
          emit(state.copyWith(isLoading: false));
        },
      );
    });
  }

  final VehicleCostListUseCase _vehicleCostListUseCase;
}
