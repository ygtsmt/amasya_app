import "package:flutter/material.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/generated/l10n.dart";

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _emailController;
  bool _obscureText = true;
  bool _obscureTextConfirm = true;
  @override
  void initState() {
    super.initState();
    _obscureText = true;
    _obscureTextConfirm = true;
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              RevoScreenHeader(
                title: AppLocalizations.of(context).create_employee,
              ),
              const Divider(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            onChanged: (final value) {
                              setState(() {});
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            onChanged: (final value) {
                              setState(() {});
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: _lastNameController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person_outline),
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
                      textInputAction: TextInputAction.done,
                      obscureText: _obscureTextConfirm,
                      validator: (final String? val) =>
                          MatchValidator(errorText: AppLocalizations.current.confirm_password_error).validateMatch(
                        _passwordController.text,
                        _confirmPasswordController.text,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: Text(
                  AppLocalizations.of(context).save.toUpperCase(),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.delete_outline),
                onPressed: () {},
                label: Text(
                  AppLocalizations.of(context).delete.toUpperCase(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
