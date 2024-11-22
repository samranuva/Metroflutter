import 'package:flutter/material.dart';
import 'package:t_savaari/utils/constants/colors.dart';
import 'package:t_savaari/utils/constants/sizes.dart';
import 'package:t_savaari/utils/loaders/shimmer_effect.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RoundedCornerImage extends StatelessWidget {
  const RoundedCornerImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = true,
    this.onPressed,
    this.applyBoxShadow = false,
    this.boxShadowColor,
    //this.borderRadius = TSizes.md,
    this.borderRadius = 30,
    this.blurRadius = TSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final bool? applyBoxShadow;
  final Color? boxShadowColor;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final double blurRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: border,
            color: backgroundColor,
            boxShadow: applyBoxShadow!
                ? [
                    BoxShadow(
                      color: boxShadowColor != null
                          ? boxShadowColor!
                          : TColors.accent,
                      blurRadius: blurRadius,
                    )
                  ]
                : []),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: fit,
                    placeholder: (context, url) => ShimmerEffect(
                      width: double.infinity,
                      height: 155,
                      radius: borderRadius,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image(
                    fit: fit,
                    image: AssetImage(imageUrl),
                  ),
          ),
        ),
      ),
    );
  }
}
