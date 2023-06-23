import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_list/data/drive_list_usecase.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_list/data/models/drive_dto.dart";
import "package:revogarageapp/core/enums.dart";

part "drive_list_event.dart";
part "drive_list_state.dart";

@singleton
class DriveListBloc extends Bloc<DriveListEvent, DriveListState> {
  DriveListBloc(this._driveListUseCase) : super(const DriveListState()) {
    on<GetDriveListEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));

      final result = await _driveListUseCase.getDrives();

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

  final DriveListUseCase _driveListUseCase;
}
