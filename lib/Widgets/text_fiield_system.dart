import 'package:flutter/material.dart';

import '../Utils/color.dart';

class TextFieldSystem extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? onValidator;
  const TextFieldSystem({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.controller,
    required this.onValidator,
  }) : super(key: key);

  @override
  State<TextFieldSystem> createState() => _TextFieldSystemState();
}

class _TextFieldSystemState extends State<TextFieldSystem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 7,
            color: AppColor.bgContainerColor.withOpacity(.25),
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        validator: widget.onValidator,
        style: TextStyle(
          color: AppColor.textColor,
        ),
        decoration: InputDecoration(
          hintMaxLines: 1,
          fillColor: AppColor.bgColor,
          filled: true,
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
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: AppColor.textColor.withOpacity(.6),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
        ),
      ),
    );
  }
}
