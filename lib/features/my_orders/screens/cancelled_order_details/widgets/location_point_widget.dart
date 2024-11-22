import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class LocationPoint extends StatelessWidget {
  final String title;
  final String location;
  final bool isStart;
  
  const LocationPoint({
    super.key, 
    required this.title, 
    required this.location, 
    required this.isStart
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: SizeConfig.blockSizeHorizontal * 4,
            height: SizeConfig.blockSizeVertical * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.tertiaryColor, width: 2),
              color: isStart ? Colors.transparent : AppColors.tertiaryColor,
            ),
          ),
          SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyle.commonTextStyle19().copyWith(color: AppColors.lightGreyColor3)),
                SizedBox(height: SizeConfig.blockSizeVertical * 0.5),
                Text(location, style: AppTextStyle.commonTextStyle3()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}