import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../Utils/color.dart';

class HomeCarouselWidget extends StatefulWidget {
  const HomeCarouselWidget({
    super.key,
    required this.items,
  });

  final List items;

  @override
  State<HomeCarouselWidget> createState() => HomeCarouselWidgetState();
}

class HomeCarouselWidgetState extends State<HomeCarouselWidget> {
  CarouselController carouselController = CarouselController();
  int currentPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: widget.items.length,
          options: CarouselOptions(
            viewportFraction: 1,
            initialPage: 0,
            height: 200,
            enableInfiniteScroll: widget.items.length > 1,
            autoPlay: widget.items.length > 1,
            autoPlayAnimationDuration: const Duration(seconds: 3),
            onPageChanged: (val, _) {
              setState(() {
                currentPosition = val;
              });
            },
          ),
          itemBuilder: (context, _, index) => Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.bgContainerColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: AppColor.bgContainerColor.withOpacity(.25),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/protin.png',
              width: double.infinity,
            ),
          ),
        ),
        SizedBox(
          height: widget.items.length > 1 ? 10 : 0,
        ),
        widget.items.length > 1 ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.items.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 10,
              width: 10,
              margin: const EdgeInsets.symmetric(
                horizontal: 2
              ),
              decoration: BoxDecoration(
                color: currentPosition == index ? AppColor.primaryColor : AppColor.textColor,
                shape: BoxShape.circle,
              ),
            );
          }),
        ) : const SizedBox(),
      ],
    );
  }
}
