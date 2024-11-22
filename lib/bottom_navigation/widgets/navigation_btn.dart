import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/colors.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/utils/constants/sizes.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NavigationBtn extends StatelessWidget {
  const NavigationBtn(
      {super.key,
      required this.icon,
      required this.text,
      required this.index,
      required this.currentIndex,
      required this.onPressed});
  final IconData icon;
  final String text;
  final int index;
  final int currentIndex;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: TextButton(
        onPressed: () {
          onPressed(index);
        },
        child: Container(
          padding:  EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 1.5,
              vertical: SizeConfig.blockSizeVertical * 0.5
            ),
          decoration: (currentIndex == index)
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(TSizes.borderRadiusXL),
                  border: Border.all(color: TColors.white, width: 1),
                  // boxShadow: const [
                  //   BoxShadow(color: TColors.grey, blurRadius: TSizes.sm)
                  // ],
                  // color: TColors.white,
                )
              : null,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: TColors.white, size: SizeConfig.blockSizeHorizontal * 6,
                  // (currentIndex == index) ? TColors.primary : TColors.white,
                  ),
              if (currentIndex == index)
                // const SizedBox(
                //   width: TSizes.sm,
                // ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal * 1.2
                ),
              if (currentIndex == index)
                Animate(
                  effects: const [
                    FadeEffect(),
                    SlideEffect(
                        delay: Duration(microseconds: 200),
                        begin: Offset(-.4, 0))
                  ],
                  child: SizedBox(
                    //width: 45,
                    width: SizeConfig.blockSizeHorizontal * 11,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.commonTextStyle17().copyWith(
                        color: AppColors.whiteColor
                      )
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
