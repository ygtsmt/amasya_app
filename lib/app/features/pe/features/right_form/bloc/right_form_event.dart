part of "right_form_bloc.dart";

abstract class RightFormEvent extends Equatable {
  const RightFormEvent();

  @override
  List<Object> get props => [];
}

class CreateRightEvent extends RightFormEvent {
  const CreateRightEvent({required this.name, required this.text});

  final String name;
  final String text;

  @override
  List<Object> get props => [name, text];
}

class UpdateRightEvent extends RightFormEvent {
  const UpdateRightEvent( this.right);

  final RightListShortDto right;

  @override
  List<Object> get props => [right];
}

class DeleteRightEvent extends RightFormEvent {
  const DeleteRightEvent({
    required this.rightId,
  });

  final int rightId;
  @override
  List<Object> get props => [rightId];
}
