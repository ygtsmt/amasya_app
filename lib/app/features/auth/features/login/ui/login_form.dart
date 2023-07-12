import 'package:amasyaapp/app/features/auth/ui/login_logo.dart';
import 'package:amasyaapp/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

String deneme = "";

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  final TextEditingController _userIdController = TextEditingController(text: "users1");
  final TextEditingController _passwordController = TextEditingController(text: "users1Sifre");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  void login(BuildContext context) async {
    String kullaniciAdi = _userIdController.text;
    String password = _passwordController.text;

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('kullaniciAdi', isEqualTo: kullaniciAdi)
        .where('sifre', isEqualTo: password)
        .get();

    if (snapshot.docs.isNotEmpty) {
      deneme = _userIdController.text;

      // ignore: use_build_context_synchronously
      context.router.replace(const HomeScreenRoute());
    } else {
      deneme = "";
      // ignore: use_build_context_synchronously
      context.router.replace(const HomeScreenRoute());

      /* ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Başarısız',
          ),
        ),
      ); */
    }
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
                    'Giriş Yap',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Giriş yapmak için lütfen gerekli alanları doldurun.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _userIdController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Kullanıcı Adı',
                      prefixIcon: Icon(
                        Icons.person_outline_outlined,
                      ),
                    ),
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: 'error'),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    autofillHints: const <String>[AutofillHints.password],
                    decoration: InputDecoration(
                      labelText: 'Şifre',
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
                        RequiredValidator(errorText: 'error'),
                        PatternValidator(passwordRegex, errorText: 'error'),
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
                    child: FilledButton(
                      onPressed: () async {
                        login(context);
                      },
                      child: const Text(
                        'GİRİŞ YAP',
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                TextButton(
                  onPressed: () {
            //        context.router.navigate(const SignupScreenRoute());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Henüz hesabınız yok mu? ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Hemen Oluştur!',
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
