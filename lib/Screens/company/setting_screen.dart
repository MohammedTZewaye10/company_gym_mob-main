import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/Utils/color.dart';
import 'package:gym_app/Widgets/back_button_title.dart';
import 'package:gym_app/responsive.dart';
import 'package:provider/provider.dart';

import '../../Provider/provider.dart';
import '../../Widgets/big_text.dart';
import 'delivery/delivery_company.dart';
import 'language_company.dart';

class SettingCompanyScreen extends StatefulWidget {
  static const String routeName = '/setting_company';
  const SettingCompanyScreen({super.key});

  @override
  State<SettingCompanyScreen> createState() => _SettingCompanyScreenState();
}

class _SettingCompanyScreenState extends State<SettingCompanyScreen> {
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
                  const BackButtonAndTitle(title: "Settings"),
                  const SizedBox(height: 30),
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
                    text: "Language",
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
                      Navigator.of(context)
                          .pushNamed(LanguageCompanyScreen.routeName);
                    },
                  ),
                  cardWidget(
                    context,
                    text: "Delivery",
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
                      Navigator.of(context)
                          .pushNamed(DeliveryCompanyScreen.routeName);
                    },
                  ),
                  cardWidget(
                    context,
                    text: "Sign Out",
                    dense: false,
                    onTap: () {},
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
