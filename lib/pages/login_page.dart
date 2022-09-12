import 'package:chatters/providers/authentication_provider.dart';
import 'package:chatters/utils/app_dimensions.dart';
import 'package:chatters/utils/validation_regex.dart';
import 'package:chatters/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final loginFormKey = GlobalKey<FormState>();

    AuthenticationProvider authenticationProvider =
        Provider.of<AuthenticationProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: deviceSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Chatters',
                style: textTheme.headline1,
              ),
              Form(
                key: loginFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      label: 'Login',
                      controller: authenticationProvider.loginController,
                      regExp: ValidationRegExp.login,
                      errorMessage: 'Please, enter valid email',
                    ),
                    CustomTextFormField(
                      label: 'Password',
                      controller: authenticationProvider.passwordController,
                      regExp: ValidationRegExp.password,
                      obscureText: true,
                      errorMessage: 'Please, enter valid password',
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
                      onPressed: () => authenticationProvider.login(
                        loginFormKey,
                        context,
                      ),
                      child: const Text('LOGIN'),
                    ),
                    OutlinedButton(
                      onPressed: () =>
                          authenticationProvider.navigateToRegisterPage(),
                      child: const Text('REGISTER'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
