import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'spinkit.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader({
    Key? key,
    required this.imageUrl,
    this.borderRadius,
    this.errorHeight,
    this.errorWidth,
    this.fit,
    this.color,
    this.id,
    this.loadingHeight,
  }) : super(key: key);

  final String imageUrl;
  final BorderRadius? borderRadius;
  final double? errorHeight, errorWidth, loadingHeight;
  final BoxFit? fit;
  final String? id;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(10),
      child: CachedNetworkImage(
        fit: fit ?? BoxFit.fill,
        color: color,
        cacheKey: id,
        imageUrl: imageUrl,
        errorWidget: (context, url, exc) {
          return Center(
            child: Icon(
              Icons.error,
              color: Colors.red.withOpacity(0.7),
              size: 30,
            ),
          );
        },
        placeholder: (context, url) {
          return SizedBox(
            height: loadingHeight ?? MediaQuery.of(context).size.height * 0.45,
            child: const Spinkit(),
          );
        },
      ),
    );
  }
}
