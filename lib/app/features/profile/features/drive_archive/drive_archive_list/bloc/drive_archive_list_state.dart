part of "drive_archive_list_bloc.dart";

class DriveArchiveListState extends Equatable {
  const DriveArchiveListState({
    this.drives,
    this.status = EventStatus.idle,
  });

  final EventStatus status;
  final List<DriveDto>? drives;

  DriveArchiveListState copyWith({
    final List<DriveDto>? drives,
    final EventStatus? status,
  }) {
    return DriveArchiveListState(
      drives: drives ?? this.drives,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [drives];
}
