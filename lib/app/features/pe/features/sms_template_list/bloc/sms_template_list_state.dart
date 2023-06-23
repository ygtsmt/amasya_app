part of "sms_template_list_bloc.dart";

class SmsTemplateListState extends Equatable {
  const SmsTemplateListState({
    required this.isLoading,
    required this.smsTemplateList,
  });

  final bool isLoading;
  final List<SmsTemplateListShortDto> smsTemplateList;

  SmsTemplateListState copyWith({
    final bool? isLoading,
    final List<SmsTemplateListShortDto>? smsTemplateList,
  }) {
    return SmsTemplateListState(
      isLoading: isLoading ?? this.isLoading,
      smsTemplateList: smsTemplateList ?? this.smsTemplateList,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        smsTemplateList,
      ];
}

class SmsTemplateListInitial extends SmsTemplateListState {
  const SmsTemplateListInitial()
      : super(
          isLoading: false,
          smsTemplateList: const [],
        );
}
