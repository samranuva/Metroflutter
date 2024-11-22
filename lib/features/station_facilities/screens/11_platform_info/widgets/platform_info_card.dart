import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class PlatformInfoCard extends StatelessWidget {
  final String title;
  final String subTitle;

  const PlatformInfoCard({
    super.key, 
    required this.title, 
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 4,
        vertical: SizeConfig.blockSizeVertical * 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            //color: Colors.black12,
            child: Image.asset(
              TImages.stationFacilitiesItem11,
              height: SizeConfig.blockSizeHorizontal * 14, 
            ),
          ),
          SizedBox(width: SizeConfig.blockSizeHorizontal * 4),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.commonTextStyle10().copyWith(color: AppColors.blackColor)
              ),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: AppTextStyle.commonTextStyle10().copyWith(color: AppColors.lightGreyColor3)
              ),
            ],
          )
        ],
      )

    );
  }
}