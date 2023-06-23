part of "sms_template_list_bloc.dart";

abstract class SmsTemplateListEvent extends Equatable {
  const SmsTemplateListEvent();

  @override
  List<Object> get props => [];
}

class GetSmsTemplateListEvent extends SmsTemplateListEvent {}

class SearchSmsTemplateListEvent extends SmsTemplateListEvent {
  const SearchSmsTemplateListEvent(this.searchText);

  final String searchText;
  @override
  List<Object> get props => [searchText];
}
