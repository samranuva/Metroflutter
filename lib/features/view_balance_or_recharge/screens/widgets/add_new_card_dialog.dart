// custom_dialog_helper.dart
import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/custom_borderded_textfield.dart';
import 'package:t_savaari/common/components/custom_elevated_button.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class AddNewCardDialog {
  static void showCustomDialog(BuildContext context) {
    SizeConfig.init(context);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal:  SizeConfig.blockSizeHorizontal * 5,
              vertical: SizeConfig.blockSizeVertical * 2,
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add A New Card", 
                        style: AppTextStyle.commonTextStyle14()),

                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: AppColors.greyColor,
                          size: SizeConfig.blockSizeHorizontal * 5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 2),
                  const CustomBorderedTextField(
                    hintText: 'Card Name',
                    borderColor: AppColors.lightGreyColor6,
                    hintTextColor: AppColors.greyColor,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 2),
                  const CustomBorderedTextField(
                    hintText: 'Card Number',
                    maxLength: 14,
                    borderColor: AppColors.lightGreyColor6,
                    hintTextColor: AppColors.greyColor,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 3),
            
                  CustomElevatedButton(
                    height: SizeConfig.blockSizeVertical * 5,
                    width: SizeConfig.blockSizeHorizontal * 40,
                    text: 'Save',
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const ViewBalanceRecharge()),
                      // );
                    },
                  ),
            
                ],
              ),
          ),
        );
      },
    );
  }

}
