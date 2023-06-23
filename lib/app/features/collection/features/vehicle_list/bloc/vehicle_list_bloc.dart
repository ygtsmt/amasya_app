import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/data/models/vehicle_short_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/data/vehicle_list_usecase.dart";

part "vehicle_list_event.dart";
part "vehicle_list_state.dart";

@singleton
class VehicleListBloc extends Bloc<VehicleListEvent, VehicleListState> {
  VehicleListBloc(this._vehicleListUseCase) : super(const VehicleListInitial()) {
    on<GetVehicleListEvent>((final event, final emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await _vehicleListUseCase.getVehicles();

      result.when(
        (final success) {
          emit(state.copyWith(vehicles: success, isLoading: false));
        },
        (final error) {
          emit(state.copyWith(isLoading: false));
        },
      );
    });

    on<SearchVehicleListEvent>((final event, final emit) async {
      final filteredVehicleArchives = state.vehicles.where(
        (final vehicleArchive) =>
            vehicleArchive.vehicleBrandName.toLowerCase().contains(event.searchText.toLowerCase()) ||
            vehicleArchive.vin.toLowerCase().contains(event.searchText.toLowerCase()) ||
            vehicleArchive.vehicleModelName.toLowerCase().contains(event.searchText.toLowerCase()),
      );

      emit(state.copyWith(vehicles: filteredVehicleArchives.toList()));
    });
  }

  final VehicleListUseCase _vehicleListUseCase;
}
