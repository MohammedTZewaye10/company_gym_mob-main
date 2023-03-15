import 'package:flutter/material.dart';
import 'package:gym_app/Utils/color.dart';
import 'package:gym_app/Widgets/back_button_title.dart';
import 'package:gym_app/Widgets/big_text.dart';
import 'package:gym_app/Widgets/grid_view_product_company.dart';
import 'package:gym_app/responsive.dart';

class OfferScreen extends StatefulWidget {
  static const String routeName = '/offer';

  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  int isEmptyProduct = 6, isDiscount = 1;
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 5),
                  child: BackButtonAndTitle(title: "Offer"),
                ),
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
