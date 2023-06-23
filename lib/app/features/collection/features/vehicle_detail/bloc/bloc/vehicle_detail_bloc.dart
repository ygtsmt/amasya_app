import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/models/models.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_detail/data/vehicle_detail_usecase.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/bloc/vehicle_list_bloc.dart";
import "package:revogarageapp/app/features/profile/features/vehicle_archive_list/bloc/vehicle_archive_list_bloc.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/injection/injection.dart";

part "vehicle_detail_event.dart";
part "vehicle_detail_state.dart";

@singleton
class VehicleDetailBloc extends Bloc<VehicleDetailEvent, VehicleDetailState> {
  VehicleDetailBloc(this._vehicleDetailUseCase) : super(const VehicleDetailState()) {
    on<GetVehicleDetailEvent>((final event, final emit) async {
      emit(state.copyWith(getVehicleDetailStatus: EventStatus.processing));

      final response = await _vehicleDetailUseCase.getVehicleDetail(event.vehicleId);

      if (response.isSuccess()) {
        emit(state.copyWith(getVehicleDetailStatus: EventStatus.success, vehicleLongDto: response.tryGetSuccess()));
      } else {
        emit(
          state.copyWith(
            getVehicleDetailStatus: EventStatus.failure,
          ),
        );
      }
    });

    on<SetVehicleTypeEvent>((final event, final emit) async {
      // emit(state.copyWith(getVehicleDetailStatus: EventStatus.processing));

      final response = await _vehicleDetailUseCase.setVehicleType(event.vehicleId, event.vehicleTypeId);

      if (response.isSuccess()) {
        getIt<VehicleDetailBloc>().add(GetVehicleDetailEvent(event.vehicleId));
      }
    });

    on<DeleteVehicleEvent>((final event, final emit) async {
      // emit(state.copyWith(getVehicleDetailStatus: EventStatus.processing));

      final response = await _vehicleDetailUseCase.deleteVehicle(event.vehicleId);

      if (response.isSuccess()) {
        getIt<VehicleArchiveListBloc>().add(const GetVehicleArchiveListEvent());
        getIt<VehicleListBloc>().add(GetVehicleListEvent());
      }
    });
  }

  final VehicleDetailUseCase _vehicleDetailUseCase;
}
