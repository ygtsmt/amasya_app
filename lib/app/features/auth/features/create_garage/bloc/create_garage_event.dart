part of "create_garage_bloc.dart";

abstract class CreateGarageEvent extends Equatable {
  const CreateGarageEvent();

  @override
  List<Object> get props => [];
}

class CreateGarageRequestEvent extends CreateGarageEvent {
  const CreateGarageRequestEvent({
    required this.request,
  });
  final CreateGarageRequest request;
}
