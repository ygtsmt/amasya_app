part of "licence_plate_form_bloc.dart";

class LicencePlateFormState extends Equatable {
  const LicencePlateFormState({
    this.status = EventStatus.idle,
  });

  final EventStatus status;

  LicencePlateFormState copyWith({
    final EventStatus? status,
  }) {
    return LicencePlateFormState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
