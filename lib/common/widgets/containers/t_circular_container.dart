import 'package:flutter/material.dart';
import 'package:t_savaari/utils/constants/colors.dart';
import 'package:t_savaari/utils/constants/sizes.dart';


class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.margin = const EdgeInsets.all(0),
    this.child,
    this.backgroundColor = TColors.white,
    this.boxShadowColor,
    this.applyBoxShadow = false,
  });
  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color? backgroundColor;
  final Color? boxShadowColor;
  final bool applyBoxShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: backgroundColor,
        boxShadow: applyBoxShadow
            ? [
                BoxShadow(
                  color:
                      boxShadowColor != null ? boxShadowColor! : TColors.accent,
                  blurRadius: TSizes.sm,
                )
              ]
            : [],
      ),
      child: child,
    );
  }
}
