import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key,
    required this.image,
    required this.label,
    required this.color, 
    required this.onTap,
  });

  final String image;
  final String label;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.blockSizeVertical * 10, 
        width: SizeConfig.blockSizeHorizontal * 29, 
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10), 
        ),
        //padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 0), // Padding for the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: SizeConfig.blockSizeVertical * 3, 
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 1.2), 
            Text(
              label,
              textAlign: TextAlign.center,
              style: AppTextStyle.commonTextStyle7().copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w800
              )
            ),
          ],
        ),
      ),
    );
  }
}
