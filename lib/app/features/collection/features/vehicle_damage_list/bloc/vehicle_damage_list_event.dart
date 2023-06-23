part of "vehicle_damage_list_bloc.dart";

abstract class VehicleDamageListEvent extends Equatable {
  const VehicleDamageListEvent();

  @override
  List<Object> get props => [];
}

class GetVehicleDamageListEvent extends VehicleDamageListEvent {
  const GetVehicleDamageListEvent(this.vehicleId);

  final int vehicleId;
 
  @override
  List<Object> get props => [vehicleId]; 
}

class SearchDamageListEvent extends VehicleDamageListEvent {
  const SearchDamageListEvent(this.searchText);

  final String searchText;
  @override
  List<Object> get props => [searchText];
}
