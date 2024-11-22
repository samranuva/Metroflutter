import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/common/components/custom_back_button.dart';
import 'package:t_savaari/utils/constants/colors.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? onTapBack;
  final PreferredSizeWidget? bottom;

  const CommonAppBar({
    super.key,
    required this.title, 
    this.onTapBack, 
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return AppBar(
      backgroundColor: TColors.primary,
      centerTitle: true,
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 0), 
        child: Text(
          title, 
          style: AppTextStyle.commonTextStyle9(),
        ),
      ),
      leading: Navigator.canPop(context) 
          ? CustomBackButton(
              onPressed: onTapBack ?? () => Navigator.pop(context),
            )
          : null,
      // Set the preferred size for the AppBar
      toolbarHeight: SizeConfig.blockSizeVertical * 8,
      bottom: bottom,
    );
  }

  //@override
  //Size get preferredSize => Size.fromHeight(SizeConfig.blockSizeVertical * 8); 

  @override
  Size get preferredSize => Size.fromHeight(
      SizeConfig.blockSizeVertical * 8 +
      (bottom?.preferredSize.height ?? 0));
}
