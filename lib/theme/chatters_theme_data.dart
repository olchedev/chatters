import 'package:chatters/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class ChattersThemeData {
  const ChattersThemeData();

  ThemeData get materialTheme {
    return ThemeData(
      splashColor: const Color.fromRGBO(36, 35, 49, 1.0),
      backgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
      scaffoldBackgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color(0x869A2222),
        contentTextStyle: TextStyle(
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppDimensions.snackBarRadius,
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromRGBO(30, 29, 37, 1.0),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color.fromRGBO(30, 29, 37, 1.0),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.inputTextFieldBorderRadius,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(
            AppDimensions.inputTextFieldBorderRadius,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFFC9217),
          ),
          borderRadius: BorderRadius.circular(
            AppDimensions.inputTextFieldBorderRadius,
          ),
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontSize: AppDimensions.headline1Size,
          fontWeight: FontWeight.w600,
          letterSpacing: AppDimensions.headline1LetterSpacing,
        ),
        bodyText1: TextStyle(
          color: Colors.white,
          fontSize: AppDimensions.inputTextFieldLabelSize,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFFFC9217),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppDimensions.elevatedButtonRadius,
              ),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(
              vertical: AppDimensions.elevatedButtonNameVerticalPadding,
              horizontal: AppDimensions.elevatedButtonNameHorizontalPadding,
            ),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              color: Colors.white,
              fontSize: AppDimensions.elevatedButtonNameSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppDimensions.outlinedButtonRadius,
              ),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(
              color: Colors.blue,
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(
              vertical: AppDimensions.outlinedButtonNameVerticalPadding,
              horizontal: AppDimensions.outlinedButtonNameHorizontalPadding,
            ),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              fontSize: AppDimensions.outlinedButtonNameSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
