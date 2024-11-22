import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class CardDetailsWidget extends StatelessWidget {
  final void Function()? onTap;
  const CardDetailsWidget({
    super.key, 
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Image.asset(
            TImages.rechargeCardBg,
          ),
          Positioned(
            left: SizeConfig.blockSizeHorizontal * 5,
            top: SizeConfig.blockSizeVertical * 1.2,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  TImages.hydMetroLogo,
                  fit: BoxFit.cover,
                  height: SizeConfig.blockSizeHorizontal * 14,
                  width: SizeConfig.blockSizeHorizontal * 14,
                ),
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 2,
            right: SizeConfig.blockSizeHorizontal * 5,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 4,
                vertical: SizeConfig.blockSizeVertical * 1,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    TImages.topUpIcon,
                    fit: BoxFit.cover,
                    height: SizeConfig.blockSizeHorizontal * 5.5,
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                  Text(
                    'Top Up',
                    style: AppTextStyle.commonTextStyle14()
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: SizeConfig.blockSizeVertical * 1.5,
            left: SizeConfig.blockSizeHorizontal * 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '5689  8765  4412  3456',
                  style: AppTextStyle.bookTicketHeadingTextStyle().copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 1.5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: SizeConfig.blockSizeVertical * 20, 
                      child: Text(
                        'Krishna Chaitany Kumar',
                        maxLines: 2, 
                        overflow: TextOverflow.ellipsis, 
                        textAlign: TextAlign.start,
                        style: AppTextStyle.commonTextStyle4(),
                      ),
                    ),
                     
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '₹50',
                          style: AppTextStyle.commonTextStyle4(),
                        ),
                        Text(
                          'Balance',
                          style: AppTextStyle.commonTextStyle19()
                              .copyWith(color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
                    Container(
                      color: AppColors.whiteColor,
                      height: 40,
                      width: 2
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '12/25',
                          style: AppTextStyle.commonTextStyle4(),
                        ),
                        Text(
                          'Card valid',
                          style: AppTextStyle.commonTextStyle19()
                              .copyWith(color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
