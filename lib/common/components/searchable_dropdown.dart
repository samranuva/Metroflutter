import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/services.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class CustomSearchableDropdown extends StatelessWidget {
  final List<String> items;
  final String labelText;
  final ValueChanged<String?> onChanged;
  final String? selectedItem;
  final double? height;
  final double? width;
  final bool enabled ;
  final List<TextInputFormatter>? inputFormatters;

  const CustomSearchableDropdown({
    super.key,
    required this.items,
    required this.labelText,
    required this.onChanged,
    this.selectedItem,
    this.height,
    this.width,
    this.enabled = true, 
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Container(
      width: width ?? double.infinity,
      height: height ?? SizeConfig.blockSizeVertical * 5,
      padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 2),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGreyColor2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownSearch<String>(
        
        selectedItem: selectedItem,
        popupProps: PopupProps.menu(
          showSearchBox: true,
          showSelectedItems: true,
          searchFieldProps: TextFieldProps(
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: AppTextStyle.commonTextStyle14().copyWith(
                color: AppColors.lightGreyColor2,
              ),
              prefixIcon: Icon(
                Icons.search,
                size: SizeConfig.blockSizeHorizontal * 7,
                color: AppColors.lightGreyColor2,
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.greyColor
                )
              )
            ),
          ),
          containerBuilder: (context, child) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: child,
              ),
            );
          },
          itemBuilder: (context, item, isSelected) {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 1.2,
                horizontal: SizeConfig.blockSizeHorizontal * 2,
              ),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.lightGreyColor2)),
              ),
              child: Text(
                item,
                style: AppTextStyle.commonTextStyle14().copyWith(
                  color: isSelected ? AppColors.primaryColor : AppColors.blackColor,
                ),
              ),
            );
          },
        ),
        items: items,
        dropdownDecoratorProps: DropDownDecoratorProps(
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.left,
          dropdownSearchDecoration: InputDecoration.collapsed(
            hintText: labelText,
            hintStyle: AppTextStyle.commonTextStyle11(), // Style for hint text
          ),
        ),
        dropdownBuilder: (context, selectedItem) => Text(
          selectedItem ?? labelText,
          style: selectedItem != null ? AppTextStyle.commonTextStyle14() : AppTextStyle.commonTextStyle11(),
        ),
        onChanged: onChanged,
        enabled: enabled,
        
      ),
    );
  }
}
