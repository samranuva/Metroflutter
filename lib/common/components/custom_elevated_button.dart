import 'package:flutter/material.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/colors.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text; 
  final Color textColor;
  final VoidCallback onPressed; 
  final Color backgroundColor;
  final double? height; 
  final double width; 
  final double borderRadius; 

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = TColors.primary,
    this.textColor = AppColors.whiteColor,
    this.height,
    this.width = double.infinity, 
    this.borderRadius = 8.0, 
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    
    return SizedBox(
      width: width,
      height: height ?? SizeConfig.blockSizeVertical * 5,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor, 
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.blockSizeHorizontal * 4, // Text size
          ),
        ),
      ),
    );
  }
}
