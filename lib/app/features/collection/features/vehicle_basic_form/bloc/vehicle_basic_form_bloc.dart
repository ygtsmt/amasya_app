import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_basic_form/data/models/models.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_basic_form/data/vehicle_basic_form_usecase.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/bloc/bloc/vehicle_detail_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/models/models.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/injection/injection.dart";

part "vehicle_basic_form_event.dart";
part "vehicle_basic_form_state.dart";

@singleton
class VehicleBasicFormBloc extends Bloc<VehicleBasicFormEvent, VehicleBasicFormState> {
  VehicleBasicFormBloc(this._vehicleBasisUseCase) : super(const VehicleBasicFormState()) {
    on<CreateVehicleEvent>((final event, final emit) async {
      emit(state.copyWith(createVehicleStatus: EventStatus.processing));

      final result = await _vehicleBasisUseCase.createVehicle(event.request);

      result.when(
        (final vehicle) {
          emit(state.copyWith(createVehicleStatus: EventStatus.success));
          emit(state.copyWith(createVehicleStatus: EventStatus.idle));
        },
        (final error) {
          emit(state.copyWith(createVehicleStatus: EventStatus.failure));
        },
      );
    });

    on<UpdateVehicleEvent>((final event, final emit) async {
      emit(state.copyWith(updateVehicleStatus: EventStatus.processing));

      final result = await _vehicleBasisUseCase.updateVehicle(event.vehicle);

      result.when(
        (final vehicle) {
          emit(state.copyWith(updateVehicleStatus: EventStatus.success));
          emit(state.copyWith(updateVehicleStatus: EventStatus.idle));
          getIt<VehicleDetailBloc>().add(GetVehicleDetailEvent(event.vehicle.id));
        },
        (final error) {
          emit(state.copyWith(updateVehicleStatus: EventStatus.failure));
        },
      );
    });

    on<GetBrandsEvent>((final event, final emit) async {
      final result = await _vehicleBasisUseCase.getBrands();

      if (result.isSuccess()) {
        emit(state.copyWith(brands: result.tryGetSuccess()));
      }
    });

    on<GetModelsEvent>((final event, final emit) async {
      if (event.brandId == null) {
        emit(state.copyWith(models: []));
        return;
      }
      final result = await _vehicleBasisUseCase.getModels(event.brandId!);

      if (result.isSuccess()) {
        emit(state.copyWith(models: result.tryGetSuccess()));
      }
    });

    on<GetColorsEvent>((final event, final emit) async {
      final result = await _vehicleBasisUseCase.getColors();

      if (result.isSuccess()) {
        emit(state.copyWith(colors: result.tryGetSuccess()));
      }
    });

    on<GetFuelTypesEvent>((final event, final emit) async {
      final result = await _vehicleBasisUseCase.getFuelTypes();

      if (result.isSuccess()) {
        emit(state.copyWith(fuelTypes: result.tryGetSuccess()));
      }
    });
  }

  final VehicleBasicFormUseCase _vehicleBasisUseCase;
}
