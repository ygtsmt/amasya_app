import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";

part "pe_event.dart";
part "pe_state.dart";

class PeBloc extends Bloc<PeEvent, PeState> {
  PeBloc() : super(PeInitial()) {
    on<PeEvent>((final event, final emit) {
     
    });
  }
}
