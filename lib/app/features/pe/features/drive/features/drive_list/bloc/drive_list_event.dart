part of "drive_list_bloc.dart";

abstract class DriveListEvent extends Equatable {
  const DriveListEvent();

  @override
  List<Object> get props => [];
}

class GetDriveListEvent extends DriveListEvent {}
