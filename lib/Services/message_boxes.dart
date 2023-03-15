// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:gym_app/Utils/color.dart';

import '../Widgets/big_text.dart';

class MessageBoxes {
  static showConfirmDialog({
    required BuildContext context,
    required String title,
    required String desc,
    required VoidCallback onPositiveButtonTap,
    String? positiveButtonText,
    String? negativeButtonText,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          height: 225,
          width: 425,
          padding: const EdgeInsets.all(
            25,
          ),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BigText(
                  text: title,
                  fontSize: 25,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                BigText(
                  text: desc,
                  fontSize: 25,
                  color: AppColor.bgColor,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: onPositiveButtonTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        shape: const StadiumBorder(),
                        minimumSize: const Size(
                          120,
                          45,
                        ),
                      ),
                      child: BigText(
                        text: positiveButtonText ?? "Yes",
                        color: AppColor.textColor,
                      ),
                    ),
                    const SizedBox(width: 30),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.textColor,
                        shape: const StadiumBorder(),
                        side: BorderSide(
                          color: AppColor.bgColor,
                        ),
                        minimumSize: const Size(
                          120,
                          45,
                        ),
                      ),
                      child: BigText(
                        text: negativeButtonText ?? "No",
                        color: AppColor.bgColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static showWarningDialog({
    required BuildContext context,
    required String title,
    required String desc,
    required VoidCallback onPositiveButtonTap,
    String? positiveButtonText,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          height: 225,
          width: 425,
          padding: const EdgeInsets.all(
            25,
          ),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BigText(
                  text: title,
                  fontSize: 25,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                BigText(
                  text: desc,
                  fontSize: 25,
                  color: AppColor.bgColor,
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: onPositiveButtonTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    shape: const StadiumBorder(),
                    minimumSize: const Size(
                      120,
                      45,
                    ),
                  ),
                  child: BigText(
                    text: positiveButtonText ?? "OK",
                    color: AppColor.textColor,
                  ),
                ),
                const SizedBox(width: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
