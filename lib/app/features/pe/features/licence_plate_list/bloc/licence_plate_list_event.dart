part of "licence_plate_list_bloc.dart";

abstract class LicencePlateListEvent extends Equatable {
  const LicencePlateListEvent();

  @override
  List<Object> get props => [];
}

class GetLicencePlateListEvent extends LicencePlateListEvent {}

// class SearchLicencePlateEvent extends LicencePlateListEvent {
//   const SearchLicencePlateEvent(this.searchText);

//   final String searchText;

//   @override
//   List<Object> get props => [searchText];
// }

class SearchLicencePlateEvent extends LicencePlateListEvent {
  const SearchLicencePlateEvent(this.searchText);

  final String searchText;

  @override
  List<Object> get props => [searchText];
}
