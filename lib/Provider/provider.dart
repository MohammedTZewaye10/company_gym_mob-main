import 'package:flutter/material.dart';

import '../Screens/mobile/home/body_home_page.dart';
import '../Screens/mobile/main_setting_page.dart';
import '../Screens/mobile/main_system_page.dart';
import '/Utils/color.dart';

class MyProvider with ChangeNotifier {
  // ThemeMode _theme = ThemeMode.light;
  // ThemeMode get themeMode => _theme;
  bool _isDark = true;
  bool get isDark => _isDark;
  void switched(bool value) {
    _isDark = value;
    // if (_theme == ThemeMode.light) {
    //   _theme = ThemeMode.dark;
    // } else {
    //   _theme = ThemeMode.light;
    // }
    if (_isDark == true) {
      // AppColor.carouselColor = AppColor.carouselColor;
      AppColor.bgColor = AppColor.bgColor;
      AppColor.bgContainerColor = AppColor.bgContainerColor;
      AppColor.textColor = AppColor.textColor;
      // AppColor.textCarouselColor = AppColor.textCarouselColor;
    } else {
      // AppColor.carouselColor = AppColor.carouselLightColor;
      AppColor.bgColor = AppColor.bgLightColor;
      AppColor.bgContainerColor = AppColor.bgContainerLightColor;
      AppColor.textColor = AppColor.textLightColor;
      // AppColor.textCarouselColor = AppColor.textCarouselLightColor;
    }
    notifyListeners();
  }
}
