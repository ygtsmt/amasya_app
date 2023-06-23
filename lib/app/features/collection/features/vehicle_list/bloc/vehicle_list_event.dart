part of "vehicle_list_bloc.dart";

abstract class VehicleListEvent extends Equatable {
  const VehicleListEvent();

  @override
  List<Object> get props => [];
}

class GetVehicleListEvent extends VehicleListEvent {}

class SearchVehicleListEvent extends VehicleListEvent {
  const SearchVehicleListEvent(this.searchText);

  final String searchText;

  @override
  List<Object> get props => [searchText];
}
