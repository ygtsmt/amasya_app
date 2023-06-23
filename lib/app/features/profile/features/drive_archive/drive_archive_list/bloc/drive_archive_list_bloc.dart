import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_list/data/models/drive_dto.dart";
import "package:revogarageapp/app/features/profile/features/drive_archive/drive_archive_list/data/drive_archive_list_usecase.dart";
import "package:revogarageapp/core/enums.dart";

part "drive_archive_list_event.dart";
part "drive_archive_list_state.dart";

@singleton
class DriveArchiveListBloc extends Bloc<DriveArchiveListEvent, DriveArchiveListState> {
  DriveArchiveListBloc(this._driveArchiveListUseCase) : super(const DriveArchiveListState()) {
    on<GetDriveArchiveListEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _driveArchiveListUseCase.getDrives();

      result.when(
        (final success) {
          emit(state.copyWith(drives: success, status: EventStatus.success));
        },
        (final error) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });
  }

  final DriveArchiveListUseCase _driveArchiveListUseCase;
}
