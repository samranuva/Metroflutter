import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class CustomBorderedTextField extends StatelessWidget {
  final int? maxLines;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextEditingController? controller;
  final Color? hintTextColor; 
  final Color? borderColor; 
  
  const CustomBorderedTextField({
    super.key, 
    this.maxLines = 1, 
    this.hintText, 
    this.keyboardType, 
    this.maxLength,
    this.controller, 
    this.hintTextColor, 
    this.borderColor, 
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return TextField(
      maxLines: maxLines,
      controller: controller,
      style: AppTextStyle.commonTextStyle2(),
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.commonTextStyle2().copyWith(
          color: hintTextColor ?? AppColors.lightGreyColor2, 
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical * 1.5,
          horizontal: SizeConfig.blockSizeHorizontal * 3,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor ?? AppColors.lightGreyColor4), 
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor ?? AppColors.lightGreyColor4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        counterText: "", // Hides the length indicator
      ),
    );
  }
}
