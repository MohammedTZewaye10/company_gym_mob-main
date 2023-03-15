import 'package:flutter/material.dart';
import 'package:gym_app/Utils/color.dart';
import 'package:gym_app/Widgets/back_button_title.dart';
import 'package:gym_app/Widgets/big_text.dart';
import 'package:gym_app/responsive.dart';

class DeliveryCityScreen extends StatefulWidget {
  const DeliveryCityScreen({super.key});

  @override
  State<DeliveryCityScreen> createState() => _DeliveryCityScreenState();
}

class _DeliveryCityScreenState extends State<DeliveryCityScreen> {
  int isEmptyCity = 1;
  List<int> selectedItems = [];
  List<String> city = [
    'Anbar',
    'Babil',
    'Baghdad',
    'Basra',
    'Dhi Qar',
    'Al-Qadisiyyah',
    'Diyala',
    'Duhok',
    'Erbil',
    'Halabja',
    'Karbala',
    'Kirkuk',
    'Muthanna',
    'Muthanna',
    'Najaf',
    'Ninawa',
    'Salah Al-Din',
    'Sulaymaniyah',
    'Wasit',
  ];
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButtonAndTitle(title: "Iraq"),
                    TextButton(
                      onPressed: () {},
                      child: BigText(
                        text: "Save",
                        color: AppColor.textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: BigText(
                    text: "Choose country,\nwhich is available for delivery.",
                    color: AppColor.textColor,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: isEmptyCity != 0 ? 20 : 0),
                Expanded(
                  child: isEmptyCity != 0
                      ? ListView.builder(
                          itemCount: city.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(
                              bottom: 15,
                              left: 10,
                              right: 10,
                            ),
                            child: Material(
                              color: selectedItems.contains(index)
                                  ? AppColor.primaryColor
                                  : AppColor.bgContainerLightColor,
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  setState(() {
                                    if (selectedItems.contains(index)) {
                                      selectedItems.remove(index);
                                    } else {
                                      selectedItems.add(index);
                                    }
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 1,
                                      color: selectedItems.contains(index)
                                          ? AppColor.primaryColor
                                          : AppColor.bgContainerColor,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text: city[index],
                                        color: selectedItems.contains(index)
                                            ? AppColor.textColor
                                            : Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      selectedItems.contains(index)
                                          ? const Icon(
                                              Icons.check,
                                              size: 25,
                                              color: Colors.white,
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: BigText(
                            text:
                                "We dont have delivery for this\ncountry right Now",
                            color: AppColor.textColor,
                            textAlign: TextAlign.center,
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
      notMobile: const Scaffold(),
    );
  }
}
