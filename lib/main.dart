import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gym_app/Provider/play_video_provider.dart';
import 'package:gym_app/Screens/company/delivery/delivery_company.dart';
import 'package:gym_app/Screens/company/language_company.dart';
import 'package:gym_app/Screens/company/main_company_system.dart';
import 'package:gym_app/Screens/company/offer_screen.dart';
import 'package:gym_app/Screens/company/setting_screen.dart';
import 'package:provider/provider.dart';

import 'Provider/provider.dart';
import 'Screens/company/login_company.dart';
import 'Screens/mobile/language.dart';
import 'Screens/mobile/main_about_setting.dart';
import 'Screens/mobile/main_setting_page.dart';
import 'Screens/mobile/main_system_page.dart';
import 'Utils/theme.dart';
import 'Widgets/bottom_nav_bar.dart';
import 'Widgets/bottom_nav_bar_company.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<MyProvider>(
            create: (_) => MyProvider(),
          ),
          ChangeNotifierProvider<PlayVideoProvider>(
            create: (_) => PlayVideoProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GYM',
      theme: MyTheme.myTheme,
      // themeMode: Provider.of<MyProvider>(context).themeMode,

      // initialRoute: GymHomeScreen.routeName,
      initialRoute: CompanyHomeScreen.routeName,
      builder: EasyLoading.init(),
      routes: {
        // User Screens
        GymHomeScreen.routeName: (context) => const GymHomeScreen(),
        SettingScreen.routeName: (context) => const SettingScreen(),
        AboutScreen.routeName: (context) => const AboutScreen(),
        GymSystemScreen.routeName: (context) => const GymSystemScreen(),
        LanguageScreen.routeName: (context) => const LanguageScreen(),
        // Company Screens
        CompanySystemScreen.routeName: (context) => const CompanySystemScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        CompanyHomeScreen.routeName: (context) => const CompanyHomeScreen(),
        SettingCompanyScreen.routeName: (context) =>
            const SettingCompanyScreen(),
        OfferScreen.routeName: (context) => const OfferScreen(),
        LanguageCompanyScreen.routeName: (context) =>
            const LanguageCompanyScreen(),
        DeliveryCompanyScreen.routeName: (context) =>
            const DeliveryCompanyScreen(),
      },
    );
  }
}
