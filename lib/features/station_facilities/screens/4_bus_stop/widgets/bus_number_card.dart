import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class BusNumberCard extends StatelessWidget {
  final String number;

  const BusNumberCard({super.key, required this.number,});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 1.5, 
        vertical: SizeConfig.blockSizeVertical * 0.5, 
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGreyColor2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(TImages.busIcon, height: SizeConfig.blockSizeHorizontal * 3.5),
         
          SizedBox(width: SizeConfig.blockSizeHorizontal * 1),

          Text(
            number,
            style: AppTextStyle.commonTextStyle17(),
          ),
        ],
      ),
    );
  }
}