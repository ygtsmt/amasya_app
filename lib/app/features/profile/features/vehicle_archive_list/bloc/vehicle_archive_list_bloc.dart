import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/bloc/vehicle_list_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/data/models/vehicle_short_dto.dart";
import "package:revogarageapp/app/features/profile/features/vehicle_archive_list/data/vehicle_archive_list_usecase.dart";
import "package:revogarageapp/core/injection/injection.dart";

part "vehicle_archive_list_event.dart";
part "vehicle_archive_list_state.dart";

@singleton
class VehicleArchiveListBloc extends Bloc<VehicleArchiveListEvent, VehicleArchiveListState> {
  VehicleArchiveListBloc(this._vehicleArchiveListUseCase) : super(const VehicleArchiveListInitial()) {
    on<GetVehicleArchiveListEvent>((final event, final emit) async {
      emit(state.copyWith(isLoading: true));

      final result = await _vehicleArchiveListUseCase.getVehicleArchives();

      result.when(
        (final success) {
          emit(state.copyWith(vehicleArchives: success, isLoading: false));
        },
        (final error) {
          emit(state.copyWith(isLoading: false));
        },
      );
    });

    on<SearchVehicleArchiveEvent>((final event, final emit) {
      final filteredVehicleArchives = state.vehicleArchives.where(
        (final vehicleArchive) =>
            vehicleArchive.vehicleBrandName.toLowerCase().contains(event.searchText.toLowerCase()) ||
            vehicleArchive.vehicleModelName.toLowerCase().contains(event.searchText.toLowerCase()),
      );

      emit(state.copyWith(vehicleArchives: filteredVehicleArchives.toList()));
    });

    on<SetVehicleArchiveEvent>((final event, final emit) async {
      final response = await _vehicleArchiveListUseCase.setVehicleArchive(event.id);

      if (response.isSuccess()) {
        getIt<VehicleArchiveListBloc>().add(const GetVehicleArchiveListEvent());
        getIt<VehicleListBloc>().add(GetVehicleListEvent());
      }
    });
  }

  final VehicleArchiveListUseCase _vehicleArchiveListUseCase;
}
