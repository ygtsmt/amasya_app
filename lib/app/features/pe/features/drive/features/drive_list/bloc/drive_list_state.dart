part of "drive_list_bloc.dart";

class DriveListState extends Equatable {
  const DriveListState({
    this.drives,
    this.status = EventStatus.idle,
  });

  final EventStatus status;
  final List<DriveDto>? drives;

  DriveListState copyWith({
    final List<DriveDto>? drives,
    final EventStatus? status,
  }) {
    return DriveListState(
      drives: drives ?? this.drives,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [drives];
}
