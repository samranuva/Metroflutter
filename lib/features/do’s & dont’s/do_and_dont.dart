import 'package:flutter/material.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class DOsAndDONTsScreen extends StatelessWidget {
  const DOsAndDONTsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CommonAppBar(title: "Covid Do’s & Dont’s",),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical * 0,
          horizontal:  SizeConfig.blockSizeHorizontal * 0,
        ),
        child: Image.asset(
          TImages.dosAndDontsImg, 
          fit: BoxFit.fitHeight,
          width: double.infinity, 
        ),
      ), 
    );
  }
}
