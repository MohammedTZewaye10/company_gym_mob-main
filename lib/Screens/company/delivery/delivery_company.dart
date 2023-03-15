import 'package:flutter/material.dart';
import 'package:gym_app/Screens/company/delivery/delivery_city.dart';
import 'package:gym_app/Utils/color.dart';
import 'package:gym_app/Widgets/back_button_title.dart';
import 'package:gym_app/Widgets/big_text.dart';
import 'package:gym_app/responsive.dart';

class DeliveryCompanyScreen extends StatefulWidget {
  static const String routeName = '/delivery_company';
  const DeliveryCompanyScreen({super.key});

  @override
  State<DeliveryCompanyScreen> createState() => _DeliveryCompanyScreenState();
}

class _DeliveryCompanyScreenState extends State<DeliveryCompanyScreen> {
  List<String> country = ['Iraq', 'Emarat', 'Suadi'];
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
                const BackButtonAndTitle(title: "Delivery Place"),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: BigText(
                    text: "Choose country,\nwhich is available for delivery.",
                    color: AppColor.textColor,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: country.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                        left: 10,
                        right: 10,
                      ),
                      child: Material(
                        color: AppColor.bgContainerLightColor,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const DeliveryCityScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: AppColor.bgContainerColor,
                              ),
                            ),
                            child: BigText(
                              text: country[index],
                              color: AppColor.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
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
