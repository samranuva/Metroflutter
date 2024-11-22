import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/features/profile/controllers/profile_controller.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class EditConfirmationDialog extends StatelessWidget {
  const EditConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showEditMobileNoConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
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
                  'Are you sure you want to change the mobile number?',
                  style: AppTextStyle.commonTextStyle11(),
                  textAlign: TextAlign.start, 
                ),
                const SizedBox(height: 20), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.end, 
                  children: [
                    TextButton(
                      onPressed: () {
                        ProfileController.instance.isMobileNumberEditable.value = false; // Disable editing
                        Get.back(); // Close the dialog
                      },
                      child: Text(
                        'No',
                        style: AppTextStyle.commonTextStyle12(),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ProfileController.instance.isMobileNumberEditable.value = true; // Enable editing
                        Get.back(); // Close the dialog
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
