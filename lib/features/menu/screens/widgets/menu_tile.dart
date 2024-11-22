import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/colors.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget({
    super.key, 
    required this.title, 
    required this.icon, 
    this.onTap,
  });

  final String title;
  final String icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12), 
      ),
      child: ListTile(
        visualDensity: VisualDensity.compact,
        onTap: onTap,
        minLeadingWidth: 0,
        leading: SvgPicture.asset(
          icon,
          color: TColors.primary,
          height: SizeConfig.blockSizeHorizontal * 5,
        ),
        title: Text(
          title, 
          style: AppTextStyle.commonTextStyle1()),
        trailing: title != "Log out" 
          ?  Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.lightGreyColor3,
              size: SizeConfig.blockSizeHorizontal * 4,
            )
          : const SizedBox(),
      ),
    );
  }
}