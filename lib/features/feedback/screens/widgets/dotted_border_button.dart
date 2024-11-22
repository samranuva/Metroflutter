import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class DottedBorderButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DottedBorderButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SizedBox(
      width: double.infinity,
      height: SizeConfig.blockSizeVertical * 5.5,
      child: CustomPaint(
        painter: DottedBorderPainter(),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.whiteColor, 
            shadowColor: Colors.transparent, 
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                TImages.cameraIcon,
                height: SizeConfig.blockSizeHorizontal * 4.5, 
                color: AppColors.primaryColor,
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal * 2.5),
              Text(
                'Add Attachment', 
                style: AppTextStyle.commonTextStyle18().copyWith(color: AppColors.primaryColor)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.primaryColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final double radius = 8.0; // Border radius for rounded corners
    final Path path = Path();

    // Define the rectangle with rounded corners
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    ));

    // Draw dotted border
    const double dashWidth = 4;
    const double dashSpace = 1;
    double distance = 0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        final bool isDash = (distance / (dashWidth + dashSpace)).floor() % 2 == 0;
        if (isDash) {
          canvas.drawPath(
            pathMetric.extractPath(distance, distance + dashWidth),
            paint,
          );
        }
        distance += dashWidth + dashSpace;
      }
      distance = 0; // Reset distance for next side
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
