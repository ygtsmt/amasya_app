
import 'package:equatable/equatable.dart';

abstract class HaberListEvent extends Equatable {
  const HaberListEvent();

  @override
  List<Object> get props => [];
}

class GetHaberListEvent extends HaberListEvent {}
 