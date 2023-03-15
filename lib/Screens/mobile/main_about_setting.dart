import 'package:flutter/material.dart';
import 'package:gym_app/Widgets/big_text.dart';

import '../../responsive.dart';
import '../../../Utils/color.dart';
import '../../../Widgets/back_button_title.dart';

class AboutScreen extends StatefulWidget {
  static const String routeName = '/about';
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5, left: 5),
                    child: BackButtonAndTitle(
                      title: "About Us",
                    ),
                  ),
                  const SizedBox(height: 45),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/circle.png',
                        ),
                      ),
                      const SizedBox(height: 20),
                      BigText(
                        text: "BiyBoy",
                        color: AppColor.textColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: BigText(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum has been the industry's standard dummy text ever since the 1500s,\nwhen an unknown printer took a galley of type and scrambled it to make a type specimen book.\nIt has survived not only five centuries, but also the leap into electronic typesetting,\nremaining essentially unchanged.",
                      fontSize: 15,
                      color: AppColor.textColor,
                      height: 1.65,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: BigText(
                            text: "Follow Us",
                            color: AppColor.textColor,
                          ),
                        ),
                        const SizedBox(height: 15),
                        cardWidget(
                          context,
                          text: "Instagram",
                          leading: Image.asset(
                            'assets/icons/Instagram.png',
                            width: 30,
                          ),
                          onTap: () {},
                        ),
                        Divider(color: AppColor.textColor),
                        cardWidget(
                          context,
                          text: "Facebook",
                          leading: Image.asset(
                            'assets/icons/facebook.png',
                            width: 30,
                          ),
                          onTap: () {},
                        ),
                        Divider(color: AppColor.textColor),
                        cardWidget(
                          context,
                          text: "Tik Tok",
                          leading: Image.asset(
                            'assets/icons/TikTok.png',
                            width: 30,
                          ),
                          onTap: () {},
                        ),
                        Divider(color: AppColor.textColor),
                        cardWidget(
                          context,
                          text: "Youtube",
                          leading: Image.asset(
                            'assets/icons/YouTube.png',
                            width: 30,
                          ),
                          onTap: () {},
                        ),
                        Divider(color: AppColor.textColor),
                        cardWidget(
                          context,
                          text: "Snapchat",
                          leading: Image.asset(
                            'assets/icons/snapchat.png',
                            width: 30,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
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
      leading: leading,
      minLeadingWidth: 5,
      // visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
