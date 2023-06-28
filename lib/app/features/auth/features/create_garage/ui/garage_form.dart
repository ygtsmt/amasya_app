import "package:amasyaapp/app/features/auth/features/create_garage/bloc/create_garage_bloc.dart";
import "package:amasyaapp/app/features/auth/features/create_garage/data/models/create_garage_request.dart";
import "package:amasyaapp/app/features/auth/ui/login_logo.dart";
import "package:amasyaapp/core/injection/injection.dart";
import "package:amasyaapp/core/utils.dart";
import "package:flutter/material.dart";
import "package:form_field_validator/form_field_validator.dart";

class GarageScreenForm extends StatefulWidget {
  const GarageScreenForm({required this.accountId, super.key});
  final int accountId;

  @override
  State<GarageScreenForm> createState() => _GarageScreenFormState();
}

class _GarageScreenFormState extends State<GarageScreenForm> {
  late final TextEditingController _garageNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _addressController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _garageNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _addressController = TextEditingController();
  }

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const LoginLogo(),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "create garage",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "create account form",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _garageNameController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.local_convenience_store_outlined),
                      labelText: "Garage Name",
                    ),
                    validator: RequiredValidator(errorText: "error"),
                  ),
                  TextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "email",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: MultiValidator(
                      [
                        RequiredValidator(
                          errorText: "error",
                        ),
                        EmailValidator(
                          errorText: "error",
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: _phoneNumberController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "phone number",
                      hintText: "phone hint",
                      prefixIcon: Icon(Icons.phone_outlined),
                    ),
                    validator: MultiValidator(
                      [
                        RequiredValidator(
                          errorText: "error",
                        ),
                        MinLengthValidator(
                          17,
                          errorText: "error",
                        )
                      ],
                    ),
                    inputFormatters: [PhoneTextMaskFormatter.maskFormatter],
                  ),
                  TextFormField(
                    controller: _addressController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "error",
                      prefixIcon: Icon(Icons.location_on_outlined),
                    ),
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: "error"),
                      ],
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  getIt<CreateGarageBloc>().add(
                    CreateGarageRequestEvent(
                      request: CreateGarageRequest(
                        name: _garageNameController.text,
                        email: _emailController.text,
                        phoneNumber: _phoneNumberController.text,
                        address: _addressController.text,
                        accountId: widget.accountId,
                      ),
                    ),
                  );
                }
              },
              child: const Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}
