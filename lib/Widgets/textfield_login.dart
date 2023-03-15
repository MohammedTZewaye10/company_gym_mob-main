import 'package:flutter/material.dart';

import '../Utils/color.dart';

class TextFieldLogin extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? onValidator;

  // for validation // back end
  // final VoidCallback onChange;
  const TextFieldLogin({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.onValidator,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 7,
            color: AppColor.bgContainerColor.withOpacity(.25),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText!,
        style: TextStyle(
          color: AppColor.textColor,
        ),
        validator: (input) {
          if (input == null || input.isEmpty) {
            return 'Please enter the information';
          }
          return null;
        },
        keyboardType: keyboardType,
        decoration: InputDecoration(
          fillColor: AppColor.bgColor,
          filled: true,
          hintMaxLines: 1,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColor.bgContainerColor.withOpacity(.6),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColor.bgContainerColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColor.textColor.withOpacity(.6),
          ),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
        ),
      ),
    );
  }
}
