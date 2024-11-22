import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class CustomBackButton extends StatelessWidget {
  final void Function()? onPressed;

  const CustomBackButton({
    super.key, 
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeHorizontal * 4,
        top: SizeConfig.blockSizeVertical * 2,
      ), 
      child: Align(
        alignment: Alignment.topLeft,
        child: CircleAvatar(
          backgroundColor: AppColors.whiteColor,
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
              onPressed: onPressed ?? () => Get.back(),
            ),
          ),
        ),
      ),
    );
  }
}