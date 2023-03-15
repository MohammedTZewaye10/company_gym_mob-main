import 'package:flutter/material.dart';

import 'color.dart';

class MyTheme {
  MyTheme._();

  static ThemeData myTheme = ThemeData(
    primarySwatch: Colors.orange,
    unselectedWidgetColor: AppColor.bgContainerColor,
    scaffoldBackgroundColor: AppColor.bgColor,
    backgroundColor: AppColor.bgColor,
    brightness: Brightness.light,
    fontFamily: 'Roboto',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: bottonStyle(
        bgColor: AppColor.primaryColor,
        fgColor: Colors.white,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: bottonStyle(
        bgColor: Colors.white,
        fgColor: AppColor.primaryColor,
        borderSide: const BorderSide(
          width: 1.5,
          color: AppColor.primaryColor,
        ),
      ),
    ),
    dividerTheme: const DividerThemeData(
      thickness: 1,
    ),
  );
}

ButtonStyle bottonStyle({
  required Color bgColor,
  required Color fgColor,
  BorderSide? borderSide,
}) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(bgColor),
    foregroundColor: MaterialStateProperty.all(fgColor),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevation: MaterialStateProperty.all(0),
    side: MaterialStateProperty.all(borderSide),
    textStyle: MaterialStateProperty.all(
      const TextStyle(
        fontSize: 18,
        fontFamily: 'Roboto',
      ),
    ),
    minimumSize: MaterialStateProperty.all(
      const Size(
        double.infinity,
        56,
      ),
    ),
  );
}
