part of "licence_plate_list_bloc.dart";

class LicencePlateListState extends Equatable {
  const LicencePlateListState({
    required this.isLoading,
    required this.licencePlates,
  });

  final bool isLoading;
  final List<LicencePlateShortDto> licencePlates;

  LicencePlateListState copyWith({
    final bool? isLoading,
    final List<LicencePlateShortDto>? licencePlates,
  }) {
    return LicencePlateListState(
      isLoading: isLoading ?? this.isLoading,
      licencePlates: licencePlates ?? this.licencePlates,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        licencePlates,
      ];
}

class LicencePlateListInitial extends LicencePlateListState {
  const LicencePlateListInitial()
      : super(
          isLoading: false,
          licencePlates: const [],
        );
}
