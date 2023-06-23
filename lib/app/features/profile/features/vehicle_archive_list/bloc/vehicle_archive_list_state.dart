part of "vehicle_archive_list_bloc.dart";

class VehicleArchiveListState extends Equatable {
  const VehicleArchiveListState({
    required this.isLoading,
    required this.vehicleArchives,
  });

  final bool isLoading;
  final List<VehicleShortDto> vehicleArchives;

  VehicleArchiveListState copyWith({
    final bool? isLoading,
    final List<VehicleShortDto>? vehicleArchives,
  }) {
    return VehicleArchiveListState(
      isLoading: isLoading ?? this.isLoading,
      vehicleArchives: vehicleArchives ?? this.vehicleArchives,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        vehicleArchives,
      ];
}

class VehicleArchiveListInitial extends VehicleArchiveListState {
  const VehicleArchiveListInitial()
      : super(
          isLoading: false,
          vehicleArchives: const [],
        );
}
