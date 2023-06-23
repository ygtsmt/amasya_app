import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_list/data/models/vehicle_short_dto.dart";
import "package:revogarageapp/app/features/pe/features/customer_form/data/models/customer_dto.dart";
import "package:revogarageapp/app/features/pe/features/customer_list/data/customer_list_usecase.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_form/data/drive_form_usecase.dart";
import "package:revogarageapp/app/features/pe/features/drive/features/drive_list/data/models/drive_dto.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_list/data/licence_plate_list_usecase.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_list/data/models/licence_plate_short_dto.dart";
import "package:revogarageapp/app/features/pe/features/pe_vehicle_list/data/pe_vehicle_list_usacase.dart";
import "package:revogarageapp/app/features/pe/features/right_list/data/models/right_list_short_dto.dart";
import "package:revogarageapp/app/features/pe/features/right_list/data/right_list_usecase.dart";
import "package:revogarageapp/core/core.dart";
import "package:revogarageapp/generated/l10n.dart";

part "drive_form_event.dart";
part "drive_form_state.dart";

@singleton
class DriveFormBloc extends Bloc<DriveFormEvent, DriveFormState> {
  DriveFormBloc(
    this._customerListUseCase,
    this._vehicleListUseCase,
    this._licencePlateListUseCase,
    this._rightListUseCase,
    this._driveFormUseCase,
    this._snackBarService,
  ) : super(const DriveFormState()) {
    on<GetCustomersEvent>((final event, final emit) async {
      final garageId = getIt<AppBloc>().state.garage!.id;
      final result = await _customerListUseCase.getCustomers(garageId);

      result.when(
        (final success) {
          emit(state.copyWith(customers: success));
        },
        (final error) {},
      );
    });

    on<GetVehiclesEvent>((final event, final emit) async {
      final result = await _vehicleListUseCase.getVehicles();

      result.when(
        (final success) {
          emit(state.copyWith(vehicles: success));
        },
        (final error) {},
      );
    });

    on<GetLicencePlatesEvent>((final event, final emit) async {
      final result = await _licencePlateListUseCase.getLicencePlates();

      result.when(
        (final success) {
          emit(state.copyWith(licencePlates: success));
        },
        (final error) {},
      );
    });

    on<GetRightsEvent>((final event, final emit) async {
      final garageId = getIt<AppBloc>().state.garage!.id;
      final result = await _rightListUseCase.getRights(garageId);

      result.when(
        (final success) {
          emit(state.copyWith(rights: success));
        },
        (final error) {},
      );
    });

    on<SaveDriveEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));
      final result = await _driveFormUseCase.saveDrive(event.drive);

      result.when(
        (final success) {
          emit(state.copyWith(status: EventStatus.success));
          emit(state.copyWith(status: EventStatus.idle));
        },
        (final error) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });

    on<UpdateDriveEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));
      final result = await _driveFormUseCase.updateDrive(event.drive);

      result.when(
        (final success) {
          emit(state.copyWith(status: EventStatus.success));
          emit(state.copyWith(status: EventStatus.idle));
        },
        (final error) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });

    on<DeleteDriveEvent>((final event, final emit) async {
      emit(state.copyWith(status: EventStatus.processing));
      final result = await _driveFormUseCase.deleteDrive(event.id);

      result.when(
        (final success) {
          emit(state.copyWith(status: EventStatus.success));
          emit(state.copyWith(status: EventStatus.idle));
        },
        (final error) {
          emit(state.copyWith(status: EventStatus.failure));
        },
      );
    });

    on<SendDrivePdfEvent>((final event, final emit) async {
      final result = await _driveFormUseCase.sendDrivePdf(event.id);

      if (result.isSuccess()) {
        _snackBarService.showSnackBar(AppLocalizations.current.pdf_success);
      }
    });
  }

  final CustomerListUseCase _customerListUseCase;
  final PeVehicleListUseCase _vehicleListUseCase;
  final LicencePlateListUseCase _licencePlateListUseCase;
  final RightListUseCase _rightListUseCase;
  final DriveFormUseCase _driveFormUseCase;
  final SnackBarService _snackBarService;
}
