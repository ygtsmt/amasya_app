import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/data/models/vehicle_damage_list_short_dto.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/data/vehicle_damage_list_usecase.dart";

part "vehicle_damage_list_event.dart";
part "vehicle_damage_list_state.dart";

@singleton
class VehicleDamageListBloc extends Bloc<VehicleDamageListEvent, VehicleDamageListState> {
  VehicleDamageListBloc(this._vehicleDamagaListUseCase) : super(const VehicleDamageListInitial()) {
    on<GetVehicleDamageListEvent>((final event, final emit) async {
      emit(state.copyWith(isLoading: true));

      final result = await _vehicleDamagaListUseCase.getDamages(event.vehicleId);

      result.when(
        (final success) {
          emit(state.copyWith(damageList: success, isLoading: false));
        },
        (final error) {
          emit(state.copyWith(isLoading: false));
        },
      );
    });

    on<SearchDamageListEvent>(
      (final event, final emit) {
        final filtredDamages = state.damageList
            .where((final damages) => damages.name.toLowerCase().contains(event.searchText.toLowerCase()));
        emit(state.copyWith(damageList: filtredDamages.toList()));
      },
    );
  }

  final VehicleDamageListUseCase _vehicleDamagaListUseCase;
}
