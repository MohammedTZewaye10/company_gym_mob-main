import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final double height;
  final TextDirection? textDirection;

  const BigText({
    Key? key,
    required this.text,
    required this.color,
    this.height = 1,
    this.fontFamily = 'Roboto_R',
    this.fontWeight = FontWeight.normal,
    this.fontSize = 20,
    this.textAlign = TextAlign.left,
    this.textDecoration = TextDecoration.none,
    this.textOverflow,
    this.maxLines,
    this.textDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: textDirection,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        decoration: textDecoration,
        overflow: textOverflow,
        fontFamily: fontFamily,
        height: height,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
