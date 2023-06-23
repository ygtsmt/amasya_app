part of "pe_vehicle_list_bloc.dart";

abstract class PeVehicleListEvent extends Equatable {
  const PeVehicleListEvent();

  @override
  List<Object> get props => [];
}

class GetPeVehicleListEvent extends PeVehicleListEvent {}

class SearchVehicleListEvent extends PeVehicleListEvent {
  const SearchVehicleListEvent(this.searchText);

  final String searchText;

  @override
  List<Object> get props => [searchText];
}
