import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/common/components/custom_borderded_textfield.dart';
import 'package:t_savaari/common/components/custom_elevated_button.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/view_balance_or_recharge/controllers/view_balance_recharge_controller.dart';

class ViewBalanceOrRechargeScreen extends StatelessWidget {
  const ViewBalanceOrRechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller using GetX
    final viewBalanceOrRechargeController = Get.put(ViewBalanceOrRechargeController());
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CommonAppBar(
        title: "View Balance /Recharge",
        onTapBack: () {
          Get.back();  
          viewBalanceOrRechargeController.cardNameController.clear();
          viewBalanceOrRechargeController.cardNumberController.clear();
        },
      ),
      body: _buildRechargeCard(context, viewBalanceOrRechargeController),
    );
  }

  Widget _buildRechargeCard(BuildContext context, ViewBalanceOrRechargeController viewBalanceOrRechargeController) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 5,
        vertical: SizeConfig.blockSizeVertical * 6,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 5,
                vertical: SizeConfig.blockSizeVertical * 5,
              ),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Enter Smart Card Number",
                    style: AppTextStyle.commonTextStyle9().copyWith(color: AppColors.blackColor),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 3),
                  _buildCardDetailsField(context, viewBalanceOrRechargeController),
                  SizedBox(height: SizeConfig.blockSizeVertical * 5),
                  _buildSaveButton(context, viewBalanceOrRechargeController),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardDetailsField(BuildContext context, ViewBalanceOrRechargeController viewBalanceOrRechargeController) {
    return Column(
      children: [
        CustomBorderedTextField(
          hintText: 'Card Name',
          keyboardType: TextInputType.text,
          controller: viewBalanceOrRechargeController.cardNameController,
        ),
        SizedBox(height: SizeConfig.blockSizeVertical * 2),
        CustomBorderedTextField(
          hintText: 'Card Number',
          maxLength: 14,
          keyboardType: TextInputType.number,
          controller: viewBalanceOrRechargeController.cardNumberController,
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context, ViewBalanceOrRechargeController viewBalanceOrRechargeController) {
    return CustomElevatedButton(
      height: SizeConfig.blockSizeVertical * 5.5,
      text: 'Save and Recharge',
      onPressed: () {
        viewBalanceOrRechargeController.onTapSaveAndRechargeButton(context);
      },
    );
  }
}
