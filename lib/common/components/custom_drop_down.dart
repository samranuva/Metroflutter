import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class CustomDropdown extends StatelessWidget {
  final String labelText;
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?> onChanged;
  final TextStyle? labelStyle;
  final TextStyle? dropdownStyle;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? iconColor;
  final FormFieldValidator<String>? validator;
  final bool isRequired;  

  const CustomDropdown({
    super.key,
    required this.labelText,
    required this.items,
    required this.value,
    required this.onChanged,
    this.labelStyle,
    this.dropdownStyle,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.iconColor,
    this.validator, 
    this.isRequired = false, 
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // Initialize size configuration
    
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: labelText,
                style:  AppTextStyle.commonTextStyle1()
              ),
              if (isRequired)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: AppColors.redColor),
                ),
            ],
          ),
        ),
        labelStyle: labelStyle ?? const TextStyle(color: AppColors.blackColor),
        contentPadding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1), // Adjust bottom padding to reduce space
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor ?? AppColors.primaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor ?? AppColors.primaryColor),
        ),
      ),
      value: value,
      items: items,
      onChanged: onChanged,
      style: dropdownStyle ?? AppTextStyle.commonTextStyle1(),
      iconEnabledColor: iconColor ?? AppColors.primaryColor,
      validator: validator, 
    );
  }
}
