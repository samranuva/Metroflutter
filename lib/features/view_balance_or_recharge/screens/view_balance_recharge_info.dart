import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';  // Import GetX package
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/features/view_balance_or_recharge/screens/widgets/card.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/common/components/custom_bordered_drop_down.dart';
import 'package:t_savaari/common/components/custom_elevated_button.dart';
import 'package:t_savaari/utils/constants/constant_data.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/routes/routes.dart';
import 'package:t_savaari/features/view_balance_or_recharge/controllers/view_balance_recharge_info_controller.dart';
import 'package:t_savaari/features/view_balance_or_recharge/screens/widgets/add_new_card_dialog.dart';
import 'package:t_savaari/features/view_balance_or_recharge/screens/widgets/delete_card_dialog.dart';
import 'package:t_savaari/features/view_balance_or_recharge/screens/widgets/edit_card_details_dialog.dart';
import 'package:t_savaari/features/view_balance_or_recharge/screens/widgets/recent_recharge_card_widget.dart';

class ViewBalanceRechargeInfoScreen extends StatelessWidget {
  const ViewBalanceRechargeInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller using GetX
    final viewBalanceRechargeInfoController = Get.put(ViewBalanceRechargeInfoController());
    SizeConfig.init(context);
    
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CommonAppBar(title: "View Balance /Recharge",),
      body: _buildUI(context, viewBalanceRechargeInfoController)
    );
  }

  Widget _buildUI(BuildContext context, ViewBalanceRechargeInfoController viewBalanceRechargeInfoController) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 4,
              bottom: SizeConfig.blockSizeVertical * 2,
              right: SizeConfig.blockSizeHorizontal * 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardDetailsWidget(
                  onTap: () {
                    Get.toNamed(Routes.rechargePage);
                  },
                )
        
                // _buildCardNumberSelector(context, viewBalanceRechargeInfoController),
                // _buildUserInfo(),
                // _buildCardDetailsInfo(context),
              ],
            ),
          ),
          _buildRecentRechargesList(),
        ],
      ),
    );
  }

  // Widget _buildCardNumberSelector(BuildContext context, ViewBalanceRechargeInfoController viewBalanceRechargeInfoController) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: CustomBorderedDropdown(
  //           value: viewBalanceRechargeInfoController.cardNumber.value,
  //           items: viewBalanceRechargeInfoController.cardNumbersList,
  //           hint: 'Select Card',
  //           onChanged: (String? value) {
  //             viewBalanceRechargeInfoController.setCardNumber(value);
  //           },
  //         ),
  //       ),
  //       SizedBox(width: SizeConfig.blockSizeHorizontal * 5),
  //       GestureDetector(
  //         onTap: () => AddNewCardDialog.showCustomDialog(context),
  //         child: SvgPicture.asset(
  //           TImages.borderedBlueAddIcon, 
  //           height: SizeConfig.blockSizeHorizontal * 9,
  //         ),
  //       ),
  //       SizedBox(width: SizeConfig.blockSizeHorizontal * 5),
  //       GestureDetector(
  //         onTap: () => EditCardDialog.showCustomDialog(context),
  //         child: SvgPicture.asset(
  //           TImages.borderedEditIcon, 
  //           height: SizeConfig.blockSizeHorizontal * 9,
  //         ),
  //       ),
  //       SizedBox(width: SizeConfig.blockSizeHorizontal * 5),
  //       GestureDetector(
  //         onTap: () => DeleteCardDialog.showCustomDialog(context),
  //         child: SvgPicture.asset(
  //           TImages.borderedDeleteIcon, 
  //           height: SizeConfig.blockSizeHorizontal * 9,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildUserInfo() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         SvgPicture.asset(
  //           TImages.profileIcon, 
  //           height: SizeConfig.blockSizeHorizontal * 6,
  //         ),
  //         SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
  //         Text(
  //           'David',
  //           style: AppTextStyle.commonTextStyle10().copyWith(color: AppColors.blackColor),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildCardDetailsInfo(BuildContext context) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(
  //       horizontal: SizeConfig.blockSizeHorizontal * 5,
  //       vertical: SizeConfig.blockSizeVertical * 2,
  //     ),
  //     decoration: BoxDecoration(
  //       color: AppColors.whiteColor,
  //       borderRadius: BorderRadius.circular(8),
  //       border: Border.all(
  //         color: AppColors.lightGreyColor4,
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.1),
  //           spreadRadius: 3,
  //           blurRadius: 7,
  //           offset: const Offset(0, 3),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text('Card Details', style: AppTextStyle.commonTextStyle3()),
  //         SizedBox(height: SizeConfig.blockSizeVertical * 2),
  //         _buildDetailRow('Card Number', '********1234455'),
  //         _buildDetailRow('Valid Till', '12th Aug 2025'),
  //         _buildDetailRow('Balance in Card', '₹500'),
  //         SizedBox(height: SizeConfig.blockSizeVertical * 2),
  //         _buildRechargeButton(),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildDetailRow(String label, String value) {
  //   return Padding(
  //     padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 1),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SizedBox(
  //           width: SizeConfig.blockSizeHorizontal * 45,
  //           child: Text(
  //             label,
  //             style: AppTextStyle.commonTextStyle2().copyWith(color: AppColors.greyColor),
  //           ),
  //         ),
  //         Text(':   ', style: AppTextStyle.commonTextStyle2().copyWith(color: AppColors.greyColor)),
  //         Expanded(
  //           child: Text(
  //             value,
  //             style: AppTextStyle.commonTextStyle2().copyWith(color: AppColors.greyColor),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildRechargeButton() {
  //   return CustomElevatedButton(
  //     height: SizeConfig.blockSizeVertical * 5,
  //     width: SizeConfig.blockSizeHorizontal * 35,
  //     text: 'Recharge',
  //     onPressed: () {
  //       Get.toNamed(Routes.rechargePage);
  //     },
  //   );
  // }

  Widget _buildRecentRechargesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 5,
            vertical: SizeConfig.blockSizeVertical * 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Recharges',
                style: AppTextStyle.commonTextStyle3(),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.recentRechargesListPage),
                child: Text(
                  'View All',
                  style: AppTextStyle.commonTextStyle7().copyWith(
                    color: AppColors.lightBlueColor2, 
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.lightBlueColor2, 
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 54,
          child: ListView.builder(
            itemCount: recentRecharges.length,
            itemBuilder: (context, index) {
              return RecentRechargeCard(
                recentRecharge: recentRecharges[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
