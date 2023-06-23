import "package:dropdown_search/dropdown_search.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:revogarageapp/app/features/pe/features/customer_form/data/models/customer_dto.dart";
import "package:revogarageapp/app/features/pe/features/customer_list/bloc/customer_list_bloc.dart";
import "package:revogarageapp/app/features/pe/ui/screens/send_short_sms_screen/bloc/send_short_sms_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/generated/l10n.dart";

class SendShortSmsScreen extends StatefulWidget {
  const SendShortSmsScreen({
    super.key,
    this.smsTemplateText,
  });
  final String? smsTemplateText;

  @override
  State<SendShortSmsScreen> createState() => _SendShortSmsScreenState();
}

class _SendShortSmsScreenState extends State<SendShortSmsScreen> {
  late final TextEditingController _smsTextController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<CustomerDto> selectedCustomers = [];

  @override
  void initState() {
    super.initState();
    _smsTextController = TextEditingController(text: widget.smsTemplateText);
    getIt<CustomerListBloc>().add(GetCustomerListEvent());
  }

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<SendShortSmsBloc, SendShortSmsState>(
      listener: (final context, final state) {
        if (state.status == EventStatus.success) {
          selectedCustomers = [];
          Navigator.of(context).pop();
        }
      },
      builder: (final context, final state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              RevoScreenHeader(
                title: AppLocalizations.of(context).send_short_sms,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _smsTextController,
                      maxLines: null,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).sms_text,
                        prefixIcon: const Icon(Icons.sms_outlined),
                      ),
                      validator: MultiValidator(
                        [
                          RequiredValidator(
                            errorText: AppLocalizations.current.empty_error,
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CustomerListBloc, CustomerListState>(
                      builder: (final context, final state) {
                        return DropdownSearch<CustomerDto>.multiSelection(
                          validator: (final value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.current.empty_error;
                            }
                            return null;
                          },
                          items: state.customerList,
                          itemAsString: (final item) {
                            return "${item.name} ${item.surname}";
                          },
                          filterFn: (final item, final filter) {
                            return item.name.toLowerCase().contains(filter.toLowerCase()) ||
                                item.surname.toLowerCase().contains(filter.toLowerCase());
                          },
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: AppLocalizations.of(context).recipients,
                              hintText: AppLocalizations.of(context).add_recipients,
                            ),
                          ),
                          popupProps: PopupPropsMultiSelection.bottomSheet(
                            searchFieldProps: TextFieldProps(
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context).search,
                                prefixIcon: const Icon(Icons.search),
                              ),
                            ),
                            showSearchBox: true,
                          ),
                          onChanged: (final value) {
                            selectedCustomers = value;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  child: state.status == EventStatus.processing
                      ? const CircularProgressIndicator()
                      : Text(AppLocalizations.of(context).send_sms),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      getIt<SendShortSmsBloc>().add(
                        SendSmsEvent(
                          smsText: _smsTextController.text,
                          phoneNumbers: selectedCustomers.map((final e) => e.phoneNumber).toList(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
