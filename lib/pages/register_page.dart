import 'dart:io';

import 'package:chatters/providers/registration_provider.dart';
import 'package:chatters/utils/app_dimensions.dart';
import 'package:chatters/utils/validation_regex.dart';
import 'package:chatters/widgets/custom_text_form_field.dart';
import 'package:chatters/widgets/empty_user_icon.dart';
import 'package:chatters/widgets/user_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerFormKey = GlobalKey<FormState>();
    RegistrationProvider registrationProvider =
        Provider.of<RegistrationProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => registrationProvider.selectAvatar(),
            child: registrationProvider.profileImage != null
                ? UserIcon(
                    size: AppDimensions.h,
                    radius: AppDimensions.l,
                    imageFile: File(
                      registrationProvider.profileImage!.path!,
                    ),
                  )
                : const EmptyUserIcon(
                    size: AppDimensions.h,
                    radius: AppDimensions.l,
                  ),
          ),
          Form(
            key: registerFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  label: 'Name',
                  controller: registrationProvider.nameController,
                  regExp: ValidationRegExp.name,
                  errorMessage: 'Name length should be less than 35 characters',
                ),
                CustomTextFormField(
                  label: 'Email',
                  controller: registrationProvider.emailController,
                  regExp: ValidationRegExp.login,
                  errorMessage: 'Please, enter valid email',
                ),
                CustomTextFormField(
                  label: 'Password',
                  controller: registrationProvider.passwordController,
                  regExp: ValidationRegExp.password,
                  errorMessage:
                      'The password should not be less that 8 characters',
                  obscureText: registrationProvider.isPasswordHidden,
                  suffixIcon: IconButton(
                    onPressed: () => registrationProvider.showHidePassword(),
                    icon: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.white,
                      size: AppDimensions.showHidePasswordIconSize,
                    ),
                  ),
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
                  onPressed: () => registrationProvider.register(
                    registerFormKey,
                    context,
                  ),
                  child: const Text('REGISTER'),
                ),
                OutlinedButton(
                  onPressed: () =>
                      registrationProvider.navigateBackToLoginScreen(),
                  child: const Text('BACK'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
