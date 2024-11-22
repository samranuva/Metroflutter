import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class StationFacilityCard extends StatelessWidget {
  final String icon;
  final String label;
  final String content;
  final VoidCallback? onTap; 

  const StationFacilityCard({
    super.key,
    required this.icon,
    required this.label,
    required this.content,
    this.onTap,
  });

@override
Widget build(BuildContext context) {
  SizeConfig.init(context);

  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lightGreyColor2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
      child: Row(
        children: [
          Image.network(
            icon,
            height: SizeConfig.blockSizeHorizontal * 9,
          ),
          SizedBox(width: SizeConfig.blockSizeHorizontal * 5),
          Expanded( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.commonTextStyle14().copyWith(color: AppColors.blackColor),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 1),
                Text(
                  content,
                  textAlign: TextAlign.start, // Align to start for better readability
                  maxLines: null, // Allow unlimited lines for wrapping
                  overflow: TextOverflow.visible, // Avoid truncation
                  style: AppTextStyle.commonTextStyle1().copyWith(color: AppColors.greyColor),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}