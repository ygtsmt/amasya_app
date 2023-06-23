import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/data/models/list_item_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_tire_screen/data/models/vehicle_tire_detail_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_tire_screen/data/vehicle_tire_usecase.dart";
import "package:revogarageapp/core/core.dart";

part "vehicle_tire_event.dart";
part "vehicle_tire_state.dart";

@singleton
class VehicleTireBloc extends Bloc<VehicleTireEvent, VehicleTireState> {
  VehicleTireBloc(this._vehicleTireUseCase) : super(const VehicleTireState()) {
    on<GetTireBrands>((final event, final emit) async {
      final result = await _vehicleTireUseCase.getTireBrands();

      if (result.isSuccess()) {
        emit(state.copyWith(tireBrands: result.tryGetSuccess()));
      }
    });

    on<GetTireRims>((final event, final emit) async {
      final result = await _vehicleTireUseCase.getTireRims();

      if (result.isSuccess()) {
        emit(state.copyWith(tireRims: result.tryGetSuccess()));
      }
    });

    on<GetTiresEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));
      final result = await _vehicleTireUseCase.getTires(event.vehicleId);

      if (result.isSuccess()) {
        emit(state.copyWith(tires: result.tryGetSuccess(), status: EventStatus.success));
      } else {
        emit(state.copyWith(status: EventStatus.processing));
      }
    });

    on<AddTireEvent>((final event, final emit) async {
      final result = await _vehicleTireUseCase.addTire(event.vehicleId, event.tire);

      if (result.isSuccess()) {
        getIt<VehicleTireBloc>().add(GetTiresEvent(event.vehicleId));
        // emit(state.copyWith(tires: result.tryGetSuccess()));
      }
    });

    on<UpdateTireEvent>((final event, final emit) async {
      final result = await _vehicleTireUseCase.updateTire(event.vehicleId, event.tire);

      if (result.isSuccess()) {
        getIt<VehicleTireBloc>().add(GetTiresEvent(event.vehicleId));
        // emit(state.copyWith(tires: result.tryGetSuccess()));
      }
    });
    on<DeleteTireEvent>(
      (final event, final emit) async {
        emit(state.copyWith(status: EventStatus.processing));

        final result = await _vehicleTireUseCase.deleteTire(event.tireId);

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
  }

  final VehicleTireUseCase _vehicleTireUseCase;
}
