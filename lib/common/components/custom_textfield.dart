import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final TextStyle? textStyle;
  final BorderSide? enabledBorderSide;
  final BorderSide? focusedBorderSide;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final TextEditingController? controller;
  final bool isRequired; 
  final Widget? suffixIcon; 
  final bool enabled; 
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.textStyle,
    this.enabledBorderSide,
    this.focusedBorderSide,
    this.onChanged,
    this.validator,
    this.maxLength,
    this.controller,
    this.isRequired = false, 
    this.suffixIcon,
    this.enabled = true, 
    this.inputFormatters, 
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); 

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: labelText,
                style: textStyle ?? AppTextStyle.commonTextStyle1(),
              ),
              if (isRequired)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: AppColors.redColor),
                ),
            ],
          ),
        ),
        contentPadding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1), // Adjust padding
        enabledBorder: UnderlineInputBorder(
          borderSide: enabledBorderSide ?? const BorderSide(color: AppColors.primaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: focusedBorderSide ?? const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor), // Set the disabled border color
        ),
        counterText: "", // Hides the character counter text
        suffixIcon: suffixIcon, 
      ),
      keyboardType: keyboardType,
      style: enabled
          ? textStyle ?? AppTextStyle.commonTextStyle1() // Use normal text style if enabled
          : AppTextStyle.commonTextStyle1().copyWith(color: AppColors.lightGreyColor), // Use disabled text style if not enabled
      onChanged: onChanged,
      validator: validator,
      maxLength: maxLength,
      enabled: enabled, 
      inputFormatters: inputFormatters,
    );
  }
}
