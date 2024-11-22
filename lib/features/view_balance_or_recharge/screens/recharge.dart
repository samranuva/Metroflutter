import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/common/components/custom_bordered_drop_down.dart';
import 'package:t_savaari/common/components/custom_elevated_button.dart';
import 'package:t_savaari/utils/constants/colors.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/view_balance_or_recharge/controllers/recharge_controller.dart';
import 'package:t_savaari/features/view_balance_or_recharge/screens/widgets/exit_dialog.dart';

class RechargeScreen extends StatelessWidget {
  const RechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize GetX Controller
    final rechargeController = Get.put(RechargeController());

    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CommonAppBar(
        title: "View Balance / Recharge",
        onTapBack: () => ExitDialog.showCustomDialog(context, rechargeController),
      ),
      body: _buildUI(context, rechargeController),
    );
  }

  Widget _buildUI(BuildContext context, RechargeController rechargeController) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.blockSizeVertical * 3,
        horizontal: SizeConfig.blockSizeHorizontal * 5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardNumberSelector(context, rechargeController),
          _verticalSpacing(3),
          _buildDetailRow('Minimum Recharge Amount', '₹50'),
          _buildDetailRow('Maximum Recharge Amount', '₹3998'),
          _verticalSpacing(2),
          _buildRechargeOptionsRow(context, rechargeController),
          _verticalSpacing(4),
          _buildTermsAndConditions(rechargeController),
          _buildDisclaimerText(),
          const Spacer(),
          _buildRechargeButton(context, rechargeController),
          _verticalSpacing(5),
        ],
      ),
    );
  }

  Widget _buildCardNumberSelector(BuildContext context, RechargeController rechargeController) {
    return Obx(() {
      return CustomBorderedDropdown(
        value: rechargeController.cardNumber.value,
        items: ['10065789087744', '10065789087722', '10065789087754'],
        hint: 'Select Card',
        onChanged: rechargeController.setCardNumber,
      );
    });
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 50,
            child: Text(
              label,
              style: AppTextStyle.commonTextStyle15().copyWith(color: AppColors.greyColor),
            ),
          ),
          Text(':   ', style: AppTextStyle.commonTextStyle15().copyWith(color: AppColors.greyColor)),
          Expanded(
            child: Text(
              value,
              style: AppTextStyle.commonTextStyle15().copyWith(color: AppColors.greyColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRechargeOptionsRow(BuildContext context, RechargeController rechargeController) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: SizeConfig.blockSizeHorizontal * 50,
          child: Text('Select Recharge Option', style: AppTextStyle.commonTextStyle3()),
        ),
        _verticalSpacing(1),
        Obx(() {
          return CustomBorderedDropdown(
            height: SizeConfig.blockSizeVertical * 4,
            width: SizeConfig.blockSizeHorizontal * 25,
            value: rechargeController.rechargeAmount.value,
            items: ['50', '100', '3998'],
            hint: 'Select',
            onChanged: rechargeController.setRechargeAmount,
          );
        }),
      ],
    );
  }

  Widget _buildTermsAndConditions(RechargeController rechargeController) {
    return Column(
      children: [
        _buildTermsText(),
        _buildCheckboxRow(rechargeController),
      ],
    );
  }

  Widget _buildTermsText() {
    return RichText(
      text: TextSpan(
        style: AppTextStyle.commonTextStyle16().copyWith(color: AppColors.greyColor),
        children: [
          const TextSpan(
            text: 'For the recharge amount to be reflected in your smart card, please tap your smart card at the '
          ),
          TextSpan(
            text: 'Entry gates',
            style: AppTextStyle.commonTextStyle16().copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.greyColor,
            ),
          ),
          const TextSpan(
            text: ' or use the pre-paid option at '
          ),
          TextSpan(
            text: 'AVM/TVM',
            style: AppTextStyle.commonTextStyle16().copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.greyColor,
            ),
          ),
          const TextSpan(
            text: ' machines after 20 minutes of successful online recharge. In case smart card is not tapped within 15 days of successful online recharge, the recharge amount will automatically be refunded after 15 working days of successful recharge.'
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxRow(RechargeController rechargeController) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() {
            return Checkbox(
              checkColor: AppColors.whiteColor,
              activeColor: AppColors.primaryColor,
              side: const BorderSide(color: AppColors.primaryColor),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (bool? value) {
                rechargeController.toggleAgreedToTerms(value ?? false);
              },
              value: rechargeController.agreedToTerms.value,
            );
          }),
          Text(
            "I agree",
            style: AppTextStyle.commonTextStyle16().copyWith(color: AppColors.greyColor),
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimerText() {
    return Text(
      "* The balance is added to your smart card. For more info, contact station staff or call 040 - 2333 2555.",
      style: AppTextStyle.commonTextStyle16().copyWith(color: AppColors.redColor1),
    );
  }

  Widget _buildRechargeButton(BuildContext context, RechargeController rechargeController) {
    return Obx(() {
      return CustomElevatedButton(
        height: SizeConfig.blockSizeVertical * 5,
        text: 'Recharge',
        backgroundColor: rechargeController.canRecharge() ? TColors.primary : AppColors.greyColor,
        textColor: AppColors.whiteColor,
        onPressed: rechargeController.canRecharge()
            ? () => rechargeController.recharge(context)
            : () {},
      );
    });
  }

  SizedBox _verticalSpacing(double heightMultiplier) {
    return SizedBox(height: SizeConfig.blockSizeVertical * heightMultiplier);
  }
}
