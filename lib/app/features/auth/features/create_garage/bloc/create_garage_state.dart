part of "create_garage_bloc.dart";

class CreateGarageState extends Equatable {
  const CreateGarageState({
    this.status = EventStatus.idle,
  });

  final EventStatus status;

  CreateGarageState copyWith({
    final EventStatus? status,
  }) {
    return CreateGarageState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
