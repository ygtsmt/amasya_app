part of "vehicle_archive_list_bloc.dart";

abstract class VehicleArchiveListEvent extends Equatable {
  const VehicleArchiveListEvent();

  @override
  List<Object> get props => [];
}

class GetVehicleArchiveListEvent extends VehicleArchiveListEvent {
  const GetVehicleArchiveListEvent();
}

class SearchVehicleArchiveEvent extends VehicleArchiveListEvent {
  const SearchVehicleArchiveEvent(this.searchText);

  final String searchText;

  @override
  List<Object> get props => [searchText];
}

class SetVehicleArchiveEvent extends VehicleArchiveListEvent {
  const SetVehicleArchiveEvent({ required this.id});

  final int id;
  @override
  List<Object> get props => [id];
}
