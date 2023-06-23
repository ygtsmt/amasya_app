import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_list/data/licence_plate_list_usecase.dart";
import "package:revogarageapp/app/features/pe/features/licence_plate_list/data/models/licence_plate_short_dto.dart";

part "licence_plate_list_event.dart";
part "licence_plate_list_state.dart";

@singleton
class LicencePlateListBloc extends Bloc<LicencePlateListEvent, LicencePlateListState> {
  LicencePlateListBloc(this._licencePlateListUseCase) : super(const LicencePlateListInitial()) {
    on<GetLicencePlateListEvent>((final event, final emit) async {
      emit(state.copyWith(isLoading: true));

      final result = await _licencePlateListUseCase.getLicencePlates();

      result.when(
        (final success) {
          emit(state.copyWith(licencePlates: success, isLoading: false));
        },
        (final error) {
          emit(state.copyWith(isLoading: false));
        },
      );
    });

    on<SearchLicencePlateEvent>((final event, final emit) {
      final filteredLicencePlates = state.licencePlates
          .where((final licencePlate) => licencePlate.plate.toLowerCase().contains(event.searchText.toLowerCase()));

      emit(state.copyWith(licencePlates: filteredLicencePlates.toList()));
    });
  }

  final LicencePlateListUseCase _licencePlateListUseCase;
}
