
import 'package:flutter/material.dart';

import '../Utils/color.dart';
import 'big_text.dart';

class GridViewProduct extends StatelessWidget {
  final String image, discountPercent, nameProduct, price, discountPrice;
  final VoidCallback onTap;
  const GridViewProduct({
    Key? key,
    required this.isDiscount,
    required this.nameProduct,
    required this.image,
    required this.discountPercent,
    required this.price,
    required this.discountPrice,
    required this.onTap,
  }) : super(key: key);

  final int isDiscount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: AppColor.bgContainerColor.withOpacity(.20),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.bgColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 105,
                        margin: const EdgeInsets.only(
                          right: 10,
                          left: 10,
                          top: 10,
                          bottom: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: AppColor.bgContainerColor.withOpacity(.20),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            image,
                            fit: BoxFit.cover,
                          ),
                          // TODO: ka bakarm hina errori loading ruydada
                          // child: const ImageLoader(
                          //   imageUrl:
                          //       image,
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: BigText(
                          text: nameProduct,
                          color: AppColor.textColor,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: BigText(
                                text: "$price IQD",
                                color: isDiscount == 0
                                    ? AppColor.textColor
                                    : AppColor.textColor.withOpacity(.50),
                                fontSize: 14,
                                textDecoration: isDiscount == 0
                                    ? TextDecoration.none
                                    : TextDecoration.lineThrough,
                                textOverflow: TextOverflow.fade,
                              ),
                            ),
                            SizedBox(
                              width: isDiscount == 0 ? 0 : 5,
                            ),
                            isDiscount == 0
                                ? const SizedBox()
                                :  Flexible(
                                    child: BigText(
                                      text: "$discountPrice IQD",
                                      color: AppColor.primaryTextColor,
                                      fontSize: 14,
                                      textOverflow: TextOverflow.fade,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                isDiscount != 0
                    ? Container(
                        width: 65,
                        alignment: Alignment.center,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: BigText(
                          text: "%$discountPercent",
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
