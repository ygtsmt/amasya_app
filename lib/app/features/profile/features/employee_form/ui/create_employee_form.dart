import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:revogarageapp/app/bloc/app_bloc.dart";
import "package:revogarageapp/app/features/profile/features/employee_form/bloc/employee_form_bloc.dart";
import "package:revogarageapp/app/features/profile/features/employee_form/data/models/create_employee_dto.dart";
import "package:revogarageapp/app/features/profile/features/employee_list_screen/bloc/employee_list_bloc.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/enums.dart";
import "package:revogarageapp/core/injection/injection.dart";
import "package:revogarageapp/core/regex.dart";
import "package:revogarageapp/core/utils.dart";
import "package:revogarageapp/generated/l10n.dart";

class EmployeeForm extends StatefulWidget {
  const EmployeeForm({
    this.employeeId,
    super.key,
  });

  final int? employeeId;

  bool get isEditMode => employeeId != null;
  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  bool _obscureText = true;
  bool _obscureTextConfirm = true;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _addressController;
  final garageId = getIt<AppBloc>().state.garage?.id;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.employeeId != null) {
      getIt<EmployeeFormBloc>().add(GetEmployeeEvent(employeeId: widget.employeeId!));
    }
    _obscureText = true;
    _obscureTextConfirm = true;
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController(); //text: widget.employee?.password);
    _confirmPasswordController = TextEditingController(); //text: widget.employee?.password);
    _addressController = TextEditingController(); //text: widget.employee?.address);
  }

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<EmployeeFormBloc, CreateEmployeeState>(
      listener: (final context, final state) {
        if (state.status == EventStatus.success) {
          getIt<EmployeeListBloc>().add(GetEmployeeListEvent());

          context.router.pop();
        }

        if (state.getEmployeeStatus == EventStatus.success) {
          _firstNameController.text = state.employee!.name;
          _lastNameController.text = state.employee!.surname;
          _emailController.text = state.employee!.email;
          _phoneNumberController.text = state.employee!.phoneNumber;
          _addressController.text = state.employee!.address;
        }
      },
      builder: (final context, final state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              RevoScreenHeader(
                title: widget.isEditMode == true
                    ? AppLocalizations.of(context).edit_employee
                    : AppLocalizations.of(context).create_employee,
              ),
              Column(
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
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
                        if (!widget.isEditMode)
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
                        if (!widget.isEditMode)
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
                                icon: _obscureTextConfirm
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                              ),
                            ),
                            textInputAction: TextInputAction.done,
                            obscureText: _obscureTextConfirm,
                            validator: (final String? val) =>
                                MatchValidator(errorText: AppLocalizations.current.confirm_password_error)
                                    .validateMatch(
                              _passwordController.text,
                              _confirmPasswordController.text,
                            ),
                          ),
                        TextFormField(
                          controller: _addressController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).address,
                            prefixIcon: const Icon(Icons.location_on_outlined),
                          ),
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: AppLocalizations.current.empty_error),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: FilledButton(
                              onPressed: state.status == EventStatus.processing
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        if (widget.isEditMode) {
                                          getIt<EmployeeFormBloc>().add(
                                            UpdateEmployeeEvent(
                                              CreateEmployeeDto(
                                                id: widget.employeeId,
                                                email: _emailController.text,
                                                password: _passwordController.text,
                                                name: _firstNameController.text,
                                                surname: _lastNameController.text,
                                                phoneNumber: _phoneNumberController.text,
                                                address: _addressController.text,
                                                birthDate: DateTime.now().toUtc(),
                                                type: AccountType.employee,
                                                garageId: garageId!,
                                              ),
                                            ),
                                          );
                                        } else {
                                          getIt<EmployeeFormBloc>().add(
                                            CreateEmployeeEvent(
                                              email: _emailController.text,
                                              password: _passwordController.text,
                                              name: _firstNameController.text,
                                              surname: _lastNameController.text,
                                              phoneNumber: _phoneNumberController.text,
                                              address: _addressController.text,
                                              birthDate: DateTime.now().toUtc(),
                                              type: AccountType.employee,
                                              garageId: garageId,
                                            ),
                                          );
                                        }
                                      }
                                    },
                              child: state.status == EventStatus.processing
                                  ? const SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CircularProgressIndicator(),
                                    )
                                  : Text(AppLocalizations.of(context).save),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (widget.isEditMode)
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () {
                                  getIt<EmployeeFormBloc>().add(DeleteEmployeeEvent(employeeId: widget.employeeId!));
                                },
                                label: Text(
                                  AppLocalizations.of(context).delete.toUpperCase(),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
