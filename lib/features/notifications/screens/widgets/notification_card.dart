import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final Color backgroundColor;
  final Color sideColor;

  const NotificationCard({
    super.key, 
    required this.title,
    required this.content,
    required this.date,
    required this.backgroundColor,
    required this.sideColor,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          margin: EdgeInsets.symmetric(
            vertical: SizeConfig.blockSizeVertical * 1,
          ),
          padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 2), 
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppTextStyle.commonTextStyle8()
                      ),
                    ),
                    Icon(
                      Icons.close,
                      color: AppColors.lightGreyColor,
                      size: SizeConfig.blockSizeHorizontal * 5,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 1,),
                Text(
                  content,
                  style: AppTextStyle.commonTextStyle2().copyWith(color: AppColors.greyColor),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 1.5),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    date,
                    style:  AppTextStyle.commonTextStyle2().copyWith(color: AppColors.tertiaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),


        // Side color container
        Positioned(
          left: 0,
          top: SizeConfig.blockSizeVertical * 1,
          bottom: SizeConfig.blockSizeVertical * 1,
          child: Container(
            width: 5,
            decoration: BoxDecoration(
              color: sideColor,
            ),
          ),
        ),
      ],
    );
  }
}
