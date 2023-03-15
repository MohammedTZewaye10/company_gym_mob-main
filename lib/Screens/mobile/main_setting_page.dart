import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/responsive.dart';
import 'package:provider/provider.dart';

import 'main_about_setting.dart';
import 'language.dart';
import '/Utils/color.dart';
import '/Widgets/big_text.dart';
import '../../../Provider/provider.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = '/setting';
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BigText(
                    text: "Setting",
                    color: AppColor.textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 40),
                  cardWidget(
                    context,
                    text: "Mode",
                    dense: false,
                    icon: CupertinoSwitch(
                      value:
                          Provider.of<MyProvider>(context, listen: true).isDark,
                      onChanged: (bool val) =>
                          Provider.of<MyProvider>(context, listen: false)
                              .switched(val),
                      activeColor: AppColor.bgContainerColor,
                      thumbColor: AppColor.bgContainerLightColor,
                    ),
                  ),
                  cardWidget(
                    context,
                    text: "Languages",
                    dense: false,
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColor.bgContainerColor,
                        size: 25,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(LanguageScreen.routeName);
                    },
                  ),
                  cardWidget(
                    context,
                    text: "About Us",
                    dense: false,
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColor.bgContainerColor,
                        size: 25,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(AboutScreen.routeName);
                    },
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: BigText(
                      text: "Contact With Us",
                      color: AppColor.textColor,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 13),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icons/telegram.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icons/WhatsApp.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icons/email.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icons/phone.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icons/viber.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      notMobile: const Scaffold(),
    );
  }

  Widget cardWidget(
    context, {
    required String text,
    Widget? icon,
    Widget? leading,
    VoidCallback? onTap,
    bool dense = true,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      dense: dense,
      onTap: onTap,
      title: BigText(
        text: text,
        color: AppColor.textColor,
      ),
      trailing: icon,
      leading: leading,
      minLeadingWidth: 20,
      // visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
