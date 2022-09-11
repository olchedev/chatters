import 'package:chatters/utils/app_dimensions.dart';
import 'package:chatters/utils/validation_regex.dart';
import 'package:chatters/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Chatters',
              style: theme.textTheme.headline1,
            ),
            Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    label: 'Login',
                    regExp: ValidationRegExp.login,
                    onSaved: (value) {},
                    errorMessage: 'Please, enter valid email',
                  ),
                  CustomTextFormField(
                    label: 'Password',
                    regExp: ValidationRegExp.password,
                    obscureText: true,
                    onSaved: (value) {},
                    errorMessage: 'Please, enter valid login',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                AppDimensions.xm,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('LOGIN'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('REGISTER'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
