part of "vehicle_damage_list_bloc.dart";

class VehicleDamageListState extends Equatable {
  const VehicleDamageListState({
   required this.isLoading,
   required this.damageList,
  });

  final bool isLoading;
  final List<VehicleDamageListShortDto> damageList;

  VehicleDamageListState copyWith({
   final bool? isLoading,
    final List<VehicleDamageListShortDto>? damageList,
  }) {
    return VehicleDamageListState(
      isLoading: isLoading ?? this.isLoading,
      damageList: damageList ?? this.damageList,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        damageList,
      ];
}

class VehicleDamageListInitial extends VehicleDamageListState{
   const VehicleDamageListInitial()
      : super(
          isLoading: false,
          damageList: const [],
        );
}
