import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget? mobile, notMobile;
  const ResponsiveLayout({
    super.key,
    this.mobile,
    this.notMobile,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobile!;
        } else {
          return notMobile!;
        }
      },
    );
  }
}
