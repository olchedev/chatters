import 'package:chatters/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.label,
    required this.controller,
    required this.regExp,
    required this.errorMessage,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final RegExp regExp;
  final String errorMessage;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppDimensions.inputTextFieldVerticalMargin,
        horizontal: AppDimensions.inputTextFieldHorizontalMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              AppDimensions.inputTextFieldLabelPadding,
            ),
            child: Text(
              label,
              style: textTheme.bodyText1,
            ),
          ),
          TextFormField(
            cursorColor: Colors.white,
            style: const TextStyle(
              color: Colors.white,
            ),
            obscureText: obscureText,
            validator: (value) => regExp.hasMatch(value!) ? null : errorMessage,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
