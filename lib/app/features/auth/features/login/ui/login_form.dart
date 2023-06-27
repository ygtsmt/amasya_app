import "package:amasyaapp/app/features/auth/features/login/bloc/login_bloc.dart";
import "package:amasyaapp/app/features/auth/ui/login_logo.dart";
import "package:amasyaapp/core/core.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:form_field_validator/form_field_validator.dart";

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
                    "Giriş Yap",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Giriş yapmak içim lütfen gerekli alanları doldurun.",
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
                    decoration: const InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(
                        Icons.person_outline_outlined,
                      ),
                    ),
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: "error"),
                        EmailValidator(errorText: "error"),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    autofillHints: const <String>[AutofillHints.password],
                    decoration: InputDecoration(
                      labelText: "Şifre",
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
                        RequiredValidator(errorText: "error"),
                        PatternValidator(passwordRegex, errorText: "error"),
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
                        child: const Text(
                          "Login",
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
                      text: "Henüz hesabınız yok mu?",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: "Hemen Oluştur!",
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
