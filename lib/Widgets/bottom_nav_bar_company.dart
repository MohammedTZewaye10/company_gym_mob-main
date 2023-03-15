import 'package:flutter/material.dart';
import 'package:gym_app/Screens/company/body_company_home.dart';
import 'package:gym_app/Screens/company/offer_screen.dart';
import 'package:gym_app/Screens/company/setting_screen.dart';
import 'package:gym_app/responsive.dart';

import '/Utils/color.dart';

class CompanyHomeScreen extends StatefulWidget {
  static const String routeName = '/company_home';

  const CompanyHomeScreen({super.key});

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: IndexedStack(
          index: activeIndex,
          children: const [
            BodyCompanyHomeScreen(),
            OfferScreen(),
            OfferScreen(),
            SettingCompanyScreen(),
          ],
        ),

        // extendBody: true,
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
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
                  'assets/icons/clothes_icon.png',
                  color: AppColor.primaryColor,
                  width: 25,
                ),
                icon: Image.asset(
                  'assets/icons/clothes_icon.png',
                  color: AppColor.textColor,
                  width: 25,
                ),
                label: "Add Product",
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/icons/order.png',
                  color: AppColor.primaryColor,
                  width: 25,
                ),
                icon: Image.asset(
                  'assets/icons/order.png',
                  color: AppColor.textColor,
                  width: 25,
                ),
                label: "Order",
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/icons/settings.png',
                  color: AppColor.primaryColor,
                  width: 25,
                ),
                icon: Image.asset(
                  'assets/icons/settings.png',
                  color: AppColor.textColor,
                  width: 25,
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
