part of "drive_archive_list_bloc.dart";

abstract class DriveArchiveListEvent extends Equatable {
  const DriveArchiveListEvent();

  @override
  List<Object> get props => [];
}

class GetDriveArchiveListEvent extends DriveArchiveListEvent {}
