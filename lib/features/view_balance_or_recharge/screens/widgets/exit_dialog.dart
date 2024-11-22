// custom_dialog_helper.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/routes/routes.dart';
import 'package:t_savaari/features/view_balance_or_recharge/controllers/recharge_controller.dart';

class ExitDialog {
  static void showCustomDialog(BuildContext context, RechargeController controller) {
    SizeConfig.init(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), 
          ),
          child: Padding(
            padding: EdgeInsets.all( SizeConfig.blockSizeVertical * 2), // Add padding inside the dialog
            child: Column(
              mainAxisSize: MainAxisSize.min, // Makes the dialog size fit the content
              children: [
                Text(
                  'Are you sure you want to Exit this page?',
                  style: AppTextStyle.commonTextStyle11(),
                  textAlign: TextAlign.start, 
                ),
                const SizedBox(height: 20), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.end, 
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'No',
                        style: AppTextStyle.commonTextStyle12(),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.reset();
                        
                        Get.offAllNamed(Routes.homePage);

                      },
                      child: Text(
                        'Yes',
                        style: AppTextStyle.commonTextStyle12(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
 
  }

}
