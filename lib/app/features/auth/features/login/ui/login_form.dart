import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:amasyaapp/app/features/auth/features/login/bloc/login_bloc.dart";
import "package:amasyaapp/app/features/auth/ui/login_logo.dart";
import "package:amasyaapp/core/core.dart";
import "package:amasyaapp/generated/l10n.dart";

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _obscureText = true;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - AppBar().preferredSize.height * 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const LoginLogo(),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).loginTitle.capitalize(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    AppLocalizations.of(context).loginDescription,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    autofillHints: const <String>[AutofillHints.email],
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).email,
                      prefixIcon: const Icon(
                        Icons.person_outline_outlined,
                      ),
                    ),
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: AppLocalizations.current.empty_error),
                        EmailValidator(errorText: AppLocalizations.current.email_error),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    autofillHints: const <String>[AutofillHints.password],
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
                    obscureText: _obscureText,
                    textInputAction: TextInputAction.done,
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: AppLocalizations.current.empty_error),
                        PatternValidator(passwordRegex, errorText: AppLocalizations.current.password_error),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (final context, final state) {
                      return FilledButton(
                        onPressed: () {
                          context.replaceRoute(const HomeScreenRoute());
                        },
                        child: Text(
                          AppLocalizations.of(context).loginTitle.toUpperCase(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextButton(
                  onPressed: () {
                    context.router.navigate(const SignupScreenRoute());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: AppLocalizations.of(context).signup_button_text,
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: AppLocalizations.of(context).signup_button_link,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
