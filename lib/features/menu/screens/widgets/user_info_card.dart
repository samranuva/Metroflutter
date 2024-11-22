import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/components/circular_container.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/routes/routes.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.profilePage),
      child: CircularContainer(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 2,
          vertical: SizeConfig.blockSizeVertical * 1
        ),
        margin: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical * 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              TImages.drawerProfile,
              color: AppColors.lightGreyColor4,
              height: SizeConfig.blockSizeHorizontal * 13,
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: SizeConfig.blockSizeVertical * 0.2, 
                left: SizeConfig.blockSizeHorizontal * 2.2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sam Ranuva",
                    style: AppTextStyle.commonTextStyle6().copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 0.1),
                  SizedBox(
                    width: 200,
                    child: Text(
                      "9876543210",
                      style: AppTextStyle.commonTextStyle3().copyWith(
                        color: AppColors.lightGreyColor3,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
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
