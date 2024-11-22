import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/features/profile/controllers/profile_controller.dart';
import 'package:t_savaari/features/profile/screens/widgets/profile_details_form.dart';
import 'package:t_savaari/features/profile/screens/widgets/profile_header.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/custom_back_button.dart';
import 'package:t_savaari/utils/constants/colors.dart';
import 'package:t_savaari/utils/constants/size_config.dart';


class ProfileScreen extends StatelessWidget {
    const ProfileScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: TColors.primary,
        centerTitle: true,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1.5), 
          child: Text('Profile', style: AppTextStyle.commonTextStyle9()),
        ),
        leading: const CustomBackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileHeader(),

            ProfileDetailsForm()
          ],
        ),
      ),
    );
  }


}