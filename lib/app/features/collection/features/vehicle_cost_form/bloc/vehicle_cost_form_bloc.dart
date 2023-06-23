import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_form/data/vehicle_cost_form_usecase.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_list/bloc/vehicle_cost_list_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_cost_list/data/models/vehicle_cost_list_short_dto.dart";
import "package:revogarageapp/core/core.dart";

part "vehicle_cost_form_event.dart";
part "vehicle_cost_form_state.dart";

@singleton
class VehicleCostFormBloc extends Bloc<VehicleCostFormEvent, VehicleCostFormState> {
  VehicleCostFormBloc(this._vehicleCostFormUseCase) : super(const VehicleCostFormState()) {
    on<CreateVehicleCostEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _vehicleCostFormUseCase.createVehicleCosts(event.vehicleId, event.name, event.price);

      result.when(
        (final success) {
          emit(state.copyWith(status: EventStatus.success));
          emit(state.copyWith(status: EventStatus.idle));
        },
        (final error) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });
    on<DeleteVehicleCostEvent>(
      (final event, final emit) async {
        emit(state.copyWith(status: EventStatus.processing));

        final result = await _vehicleCostFormUseCase.deleteVehicleCost(event.vehicleCostId);

        result.when(
          (final success) {
            emit(state.copyWith(status: EventStatus.success));
            emit(state.copyWith(status: EventStatus.idle));
          },
          (final error) {
            emit(state.copyWith(status: EventStatus.failure));
          },
        );
      },
    );
    on<UpdateVehicleCostEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _vehicleCostFormUseCase.updateVehicleCosts(event.vehicleCost);

      result.when(
        (final success) {
          emit(state.copyWith(status: EventStatus.success));
          emit(state.copyWith(status: EventStatus.idle));
          getIt<VehicleCostListBloc>().add(GetVehicleCostListEvent(event.vehicleCost.vehicleId!));
        },
        (final failure) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });
  }

  final VehicleCostFormUseCase _vehicleCostFormUseCase;
}
