import 'package:flutter/material.dart';
import 'package:gym_app/Utils/color.dart';

class TapToRetry extends StatelessWidget {
  const TapToRetry({
    Key? key,
    required this.message,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  final String message;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: AppColor.textColor
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: Icon(
                Icons.refresh,
                color: AppColor.textColor,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
