import 'package:flutter/material.dart';
import 'package:gym_app/responsive.dart';

import '../../Utils/color.dart';
import '../../Widgets/back_button_title.dart';
import '../../Widgets/big_text.dart';

class LanguageCompanyScreen extends StatefulWidget {
  static const String routeName = '/lang_company';
  const LanguageCompanyScreen({super.key});

  @override
  State<LanguageCompanyScreen> createState() => _LanguageCompanyScreenState();
}

class _LanguageCompanyScreenState extends State<LanguageCompanyScreen> {
  int isSelect = 0;
  List<String> list = ['English', 'Arabic', 'Kurdish'];
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButtonAndTitle(
                  title: "Language",
                ),
                const SizedBox(height: 35),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: const EdgeInsets.only(left: 10),
                    dense: false,
                    onTap: () {
                      setState(() {
                        isSelect = index;
                      });
                    },
                    title: BigText(
                      text: list[index],
                      color: AppColor.textColor,
                    ),
                    trailing: isSelect == index
                        ? Padding(
                            padding: const EdgeInsets.only(right: 250),
                            child: Icon(
                              Icons.check,
                              color: AppColor.bgContainerColor,
                            ),
                          )
                        : const SizedBox(),
                    // visualDensity: VisualDensity.adaptivePlatformDensity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      notMobile: const Scaffold(),
    );
  }
}
