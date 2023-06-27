import "package:flutter/material.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:intl/intl.dart";
import "package:amasyaapp/app/features/auth/features/create_account/bloc/create_account_bloc.dart";
import "package:amasyaapp/app/features/auth/ui/login_logo.dart";
import "package:amasyaapp/core/injection/injection.dart";
import "package:amasyaapp/core/regex.dart";
import "package:amasyaapp/core/utils.dart";
import "package:amasyaapp/generated/l10n.dart";

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({
    super.key,
  });

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  bool _obscureText = true;
  bool _obscureTextConfirm = true;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _addressController;
  late final TextEditingController _inviteCodeController;
  late final TextEditingController _birthDateController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _obscureText = true;
    _obscureTextConfirm = true;
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _addressController = TextEditingController();
    _inviteCodeController = TextEditingController();
    _birthDateController = TextEditingController();
  }

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const LoginLogo(),
          const SizedBox(
            height: 32,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).create_account,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  AppLocalizations.of(context).create_account_form,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _firstNameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).first_name,
                          prefixIcon: const Icon(Icons.person_outline),
                        ),
                        validator: RequiredValidator(
                          errorText: AppLocalizations.current.empty_error,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _lastNameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).last_name,
                        ),
                        validator: RequiredValidator(
                          errorText: AppLocalizations.current.empty_error,
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).email,
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                  validator: MultiValidator(
                    [
                      RequiredValidator(
                        errorText: AppLocalizations.current.empty_error,
                      ),
                      EmailValidator(
                        errorText: AppLocalizations.current.email_error,
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).phone_number,
                    hintText: AppLocalizations.of(context).phone_number_mask_hint_text,
                    prefixIcon: const Icon(Icons.phone_outlined),
                  ),
                  inputFormatters: [PhoneTextMaskFormatter.maskFormatter],
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).password,
                    prefixIcon: const Icon(Icons.password_outlined),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: _obscureText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: AppLocalizations.current.empty_error),
                      MinLengthValidator(8, errorText: AppLocalizations.current.password_error),
                      PatternValidator(passwordRegex, errorText: AppLocalizations.current.password_error),
                    ],
                  ),
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).confirm_password,
                    prefixIcon: const Icon(Icons.password_outlined),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureTextConfirm = !_obscureTextConfirm;
                        });
                      },
                      icon: _obscureTextConfirm ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  obscureText: _obscureTextConfirm,
                  validator: (final String? val) =>
                      MatchValidator(errorText: AppLocalizations.current.confirm_password_error).validateMatch(
                    _passwordController.text,
                    _confirmPasswordController.text,
                  ),
                ),
                TextFormField(
                  controller: _birthDateController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).date_mask_hint_text,
                    prefixIcon: const Icon(Icons.date_range_outlined),
                    labelText: AppLocalizations.of(context).birthDate,
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: [DateTextMaskFormatter.maskFormatterDate],
                ),
                TextFormField(
                  controller: _inviteCodeController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).invite_code,
                    prefixIcon: const Icon(Icons.confirmation_number_outlined),
                  ),
                ),
                TextFormField(
                  controller: _addressController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).address,
                    prefixIcon: const Icon(Icons.location_on_outlined),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final df = DateFormat("dd/MM/yyyy");
                        final birthDate =
                            _birthDateController.text.isEmpty ? null : df.parseUTC(_birthDateController.text);
                        getIt<CreateAccountBloc>().add(
                          CreateAccountEvent(
                            email: _emailController.text,
                            password: _passwordController.text,
                            name: _firstNameController.text,
                            surname: _lastNameController.text,
                            phoneNumber: _phoneNumberController.text,
                            address: _addressController.text,
                            birthDate: birthDate,
                            inviteCode: _inviteCodeController.text,
                          ),
                        );
                      }
                    },
                    child: Text(
                      AppLocalizations.of(context).continue_text.toUpperCase(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
