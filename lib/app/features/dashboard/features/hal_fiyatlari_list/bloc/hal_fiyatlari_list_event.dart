
import 'package:equatable/equatable.dart';

abstract class HalFiyatlariListEvent extends Equatable {
  const HalFiyatlariListEvent();

  @override
  List<Object> get props => [];
}

class GetHalFiyatlariListEvent extends HalFiyatlariListEvent {}
 