import 'package:flutter/material.dart';
import 'package:gym_app/responsive.dart';

import '/Utils/color.dart';
import '../Screens/mobile/home/body_home_page.dart';
import '../Screens/mobile/main_setting_page.dart';
import '../Screens/mobile/main_system_page.dart';

class GymHomeScreen extends StatefulWidget {
  static const String routeName = '/gym_home';

  const GymHomeScreen({super.key});

  @override
  State<GymHomeScreen> createState() => _GymHomeScreenState();
}

class _GymHomeScreenState extends State<GymHomeScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: IndexedStack(
          index: activeIndex,
          children: const [
            BodyHomeScreen(),
            GymSystemScreen(),
            SettingScreen(),
          ],
        ),

        // extendBody: true,
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: .75,
                color: AppColor.bgContainerColor,
              ),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColor.bgColor,
            selectedItemColor: AppColor.primaryColor,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: AppColor.textColor,
            elevation: 0,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            items: [
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/icons/home.png',
                  color: AppColor.primaryColor,
                  width: 25,
                ),
                icon: Image.asset(
                  'assets/icons/home.png',
                  color: AppColor.textColor,
                  width: 25,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/icons/system.png',
                  color: AppColor.primaryColor,
                  width: 32,
                ),
                icon: Image.asset(
                  'assets/icons/system.png',
                  color: AppColor.textColor,
                  width: 32,
                ),
                label: "System",
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/icons/settings.png',
                  color: AppColor.primaryColor,
                  width: 32,
                ),
                icon: Image.asset(
                  'assets/icons/settings.png',
                  color: AppColor.textColor,
                  width: 32,
                ),
                label: "Setting",
              ),
            ],
            currentIndex: activeIndex,
            onTap: (int index) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
      ),
      notMobile: const Scaffold(),
    );
  }
}
