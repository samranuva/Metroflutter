import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class CustomModalSheet extends StatelessWidget {
  final String title;
  final List<ModalSheetOption> options;
  final VoidCallback? onClose;
  final VoidCallback? onClear;

  const CustomModalSheet({
    super.key,
    required this.title,
    required this.options,
    this.onClose,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
      height: SizeConfig.blockSizeVertical * 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: AppColors.blackColor,
                  size: SizeConfig.blockSizeHorizontal * 6,
                ),
                onPressed: onClose ?? () => Get.back(),
              ),
              Text(
                title,
                style: AppTextStyle.commonTextStyle4().copyWith(color: AppColors.blackColor),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: AppColors.blackColor,
                  size: SizeConfig.blockSizeHorizontal * 6,
                ),
                onPressed: onClear,
              ),
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: options.map((option) {
              return GestureDetector(
                onTap: option.onTap,
                child: _buildOption(iconPath: option.iconPath, label: option.label),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildOption({required String iconPath, required String label}) {
    return Container(
      height: SizeConfig.blockSizeVertical * 7,
      width: SizeConfig.blockSizeHorizontal * 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.secondaryColor,
          width: 2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            height: SizeConfig.blockSizeVertical * 3,
          ),
          SizedBox(width: SizeConfig.blockSizeVertical * 1),
          Text(label, style: AppTextStyle.commonTextStyle10().copyWith(color: AppColors.blackColor)),
        ],
      ),
    );
  }
}

class ModalSheetOption {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  ModalSheetOption({
    required this.iconPath,
    required this.label,
    required this.onTap,
  });
}
