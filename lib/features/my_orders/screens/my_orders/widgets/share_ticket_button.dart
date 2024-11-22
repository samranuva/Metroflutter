import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class ShareTicketButton extends StatelessWidget {
  final void Function() onPressed;
  const ShareTicketButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.lightGreyColor,
        side: const BorderSide(color: AppColors.lightGreyColor2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 2,
          vertical: SizeConfig.blockSizeVertical * 0.5,
        ),
      ),
      child: Center(
        child: Row(
          children: [
            Icon(
              Icons.share,
              color: AppColors.lightGreyColor2,
              size: SizeConfig.blockSizeVertical * 2,
            ),
            SizedBox(width: SizeConfig.blockSizeHorizontal * 1),
            Text(
              'Share Ticket',
              style: AppTextStyle.commonTextStyle15().copyWith(color: AppColors.lightGreyColor2),
            ),
          ],
        ),
      ),
    );
  }
}