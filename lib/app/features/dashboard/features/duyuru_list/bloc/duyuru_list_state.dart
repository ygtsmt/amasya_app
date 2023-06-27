
import 'package:equatable/equatable.dart';
import 'package:amasyaapp/app/features/dashboard/features/duyuru_list/data/models/duyuru_model.dart';

class DuyuruListState extends Equatable {
  const DuyuruListState({
    required this.isLoading,
    required this.duyuruList,
  });

  final bool isLoading;
  final List<DuyuruModelDto> duyuruList;

  DuyuruListState copyWith({
    final bool? isLoading,
    final List<DuyuruModelDto>? duyuruList,
  }) {
    return DuyuruListState(
      isLoading: isLoading ?? this.isLoading,
      duyuruList: duyuruList ?? this.duyuruList,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        duyuruList,
      ];
}

class DuyuruListInitial extends DuyuruListState {
  const DuyuruListInitial()
      : super(
          isLoading: false,
          duyuruList: const [],
        );
}
 