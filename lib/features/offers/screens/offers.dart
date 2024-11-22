import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/common/components/custom_elevated_button.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/utils/helpers/helper_functions.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CommonAppBar(title: "Offers",),
      body: _buildUI(context),
    );
  }


  Widget _buildUI(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.blockSizeVertical * 3,
        horizontal:  SizeConfig.blockSizeHorizontal * 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Refer Apps',
            style: AppTextStyle.bookTicketHeadingTextStyle().copyWith(
              color: AppColors.blackColor
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 2),
          _buildInviteCard(context),
        ],
      )
    );
  }

  
  Widget _buildInviteCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            TImages.offersImg,
            width: double.infinity, 
            fit: BoxFit.fitHeight,
          ),

          _buildDetailView(context)       
        ],
      ),
    );
  }

  Widget _buildDetailView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 5,
        vertical: SizeConfig.blockSizeVertical * 4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Refer your Friends',
            style: AppTextStyle.commonTextStyle9().copyWith(color: AppColors.blackColor),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 2),
      
          Text(
            'Broadcast the TSavaari App link to your friends and contacts through Bluetooth, email, WhatsApp, and other channels.',
            style: AppTextStyle.commonTextStyle1().copyWith(color: AppColors.greyColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 6),
      
          CustomElevatedButton(
            height: SizeConfig.blockSizeVertical * 5.5,
            text: 'Invite Link',
            onPressed: () {
              THelperFunctions.showSnackBar('Link has been sent successfully!');
            },
          ),
        ],
      ),
    );
  }

}
