import "package:flutter/material.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/utils.dart";
import "package:revogarageapp/generated/l10n.dart";

class InviteDealerScreen extends StatefulWidget {
  const InviteDealerScreen({super.key});

  @override
  State<InviteDealerScreen> createState() => _InviteDealerScreenState();
}

class _InviteDealerScreenState extends State<InviteDealerScreen> {
  late final TextEditingController _phoneNumberController;
  bool _isCheckedAccept = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
  }

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RevoScreenHeader(
            title: AppLocalizations.of(context).inviteDealer,
          ),
          Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _phoneNumberController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).phone_number,
                        hintText: AppLocalizations.of(context).phone_number_mask_hint_text,
                        prefixIcon: const Icon(Icons.phone_outlined),
                      ),
                      validator: MultiValidator(
                        [
                          RequiredValidator(
                            errorText: AppLocalizations.current.empty_error,
                          ),
                          MinLengthValidator(
                            17,
                            errorText: AppLocalizations.of(context).phone_number_error,
                          )
                        ],
                      ),
                      inputFormatters: [PhoneTextMaskFormatter.maskFormatter],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _isCheckedAccept,
                          onChanged: (final bool? value) {
                            setState(() {
                              _isCheckedAccept = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context).accept_that_only_invite_dealer,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                AppLocalizations.of(context).check_number_correct_before_inviting_dealer,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _isCheckedAccept) {
                    } else if (!_isCheckedAccept) {
                      showSnackBarAcceptInviteConditions();
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context).send_sms.toUpperCase(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showSnackBarAcceptInviteConditions() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          AppLocalizations.of(context).please_accept_terms_conditions_before_sending_invitation,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
