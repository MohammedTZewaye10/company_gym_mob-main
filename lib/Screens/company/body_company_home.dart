import 'package:flutter/material.dart';
import 'package:gym_app/Utils/color.dart';
import 'package:gym_app/Widgets/big_text.dart';
import 'package:gym_app/responsive.dart';

import 'offer_screen.dart';
import '../../Widgets/grid_view_product_company.dart';

class BodyCompanyHomeScreen extends StatefulWidget {
  const BodyCompanyHomeScreen({super.key});

  @override
  State<BodyCompanyHomeScreen> createState() => _BodyCompanyHomeScreenState();
}

class _BodyCompanyHomeScreenState extends State<BodyCompanyHomeScreen> {
  int isEmptyProduct = 6, isDiscount = 1;
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.bgColor,
          title: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: BigText(
              text: "Your Product",
              color: AppColor.textColor,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(OfferScreen.routeName);
                },
                child: BigText(
                  text: "Offer",
                  color: AppColor.textColor,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isEmptyProduct == 0
                    ? const SizedBox()
                    : const SizedBox(height: 15),
                isEmptyProduct == 0
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: BigText(
                          text:
                              "There is no any product to show!\nPlease Add Product",
                          color: AppColor.textColor,
                          height: 1.3,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 165 / 175,
                          ),
                          itemCount: isEmptyProduct,
                          itemBuilder: (context, index) => GridViewProduct(
                            isDiscount: isDiscount,
                            image: "assets/images/product.png",
                            nameProduct: "BCAA",
                            price: "135,000",
                            discountPrice: "125,000",
                            discountPercent: "20",
                            onTap: () {},
                          ),
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
