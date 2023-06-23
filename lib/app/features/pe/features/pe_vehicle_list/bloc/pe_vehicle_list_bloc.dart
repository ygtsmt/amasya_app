import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/data/models/vehicle_short_dto.dart";
import "package:revogarageapp/app/features/pe/features/pe_vehicle_list/data/pe_vehicle_list_usacase.dart";

part "pe_vehicle_list_event.dart";
part "pe_vehicle_list_state.dart";

@singleton
class PeVehicleListBloc extends Bloc<PeVehicleListEvent, PeVehicleListState> {
  PeVehicleListBloc(this._peVehicleListUseCase) : super(const PeVehicleListInitial()) {
    on<GetPeVehicleListEvent>((final event, final emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await _peVehicleListUseCase.getVehicles();

      result.when(
        (final success) {
          emit(state.copyWith(vehicle: success, isLoading: false));
        },
        (final error) {
          emit(state.copyWith(isLoading: false));
        },
      );
    });

    on<SearchVehicleListEvent>((final event, final emit) async {
      final filteredVehicleArchives = state.vehicle.where(
        (final vehicleArchive) =>
            vehicleArchive.vehicleBrandName.toLowerCase().contains(event.searchText.toLowerCase()) ||
            vehicleArchive.vin.toLowerCase().contains(event.searchText.toLowerCase()) ||
            vehicleArchive.vehicleModelName.toLowerCase().contains(event.searchText.toLowerCase()),
      );

      emit(state.copyWith(vehicle: filteredVehicleArchives.toList()));
    });
  }

  final PeVehicleListUseCase _peVehicleListUseCase;
}
