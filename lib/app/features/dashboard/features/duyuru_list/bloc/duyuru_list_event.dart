
import 'package:equatable/equatable.dart';

abstract class DuyuruListEvent extends Equatable {
  const DuyuruListEvent();

  @override
  List<Object> get props => [];
}

class GetDuyuruListEvent extends DuyuruListEvent {}
 