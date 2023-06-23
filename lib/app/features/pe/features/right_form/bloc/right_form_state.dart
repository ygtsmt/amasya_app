part of "right_form_bloc.dart";

class RightFormState extends Equatable {
  const RightFormState({this.status = EventStatus.idle});

  final EventStatus status;

  RightFormState copyWith({
    final EventStatus? status,
  }) {
    return RightFormState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
