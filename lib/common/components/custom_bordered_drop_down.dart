import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class CustomBorderedDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String hint;
  final Function(String?)? onChanged;
  final double? height; 
  final double? width; 

  const CustomBorderedDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.hint,
    this.onChanged,
    this.height, 
    this.width, 
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    
    return Container(
      width: width ?? double.infinity,       
      height: height ?? SizeConfig.blockSizeVertical * 5,   
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 3),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGreyColor2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        hint: Text(
          hint, 
          style: AppTextStyle.commonTextStyle11(),
        ),
        underline: Container(), // Remove the default underline
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: AppTextStyle.commonTextStyle14(), // Set the text style for the dropdown items
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
