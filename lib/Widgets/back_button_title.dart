import 'package:flutter/material.dart';

import '../Utils/color.dart';
import 'big_text.dart';

class BackButtonAndTitle extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize, width;
  const BackButtonAndTitle({
    Key? key,
    this.width,
    this.color,
    this.fontSize,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset(
            'assets/icons/arrow_back.png',
            color: color ?? AppColor.bgContainerColor,
            width: width ?? 25,
          ),
        ),
        const SizedBox(width: 8),
        BigText(
          text: title,
          color: AppColor.textColor,
          fontFamily: 'Roboto_M',
          fontSize: fontSize ?? 20,
        ),
      ],
    );
  }
}
