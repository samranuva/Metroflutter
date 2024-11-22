import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/routes/routes.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/custom_back_button.dart';
import 'package:t_savaari/common/components/custom_elevated_button.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/authentication/otp/controllers/otp_controller.dart';
import 'package:t_savaari/features/authentication/otp/screens/widgets/otp_input_field.dart';
import 'package:t_savaari/utils/helpers/helper_functions.dart';

class OtpInputScreen extends StatelessWidget {
  const OtpInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpController = Get.put(OtpController());
    SizeConfig.init(context);
    
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: _buildUI(otpController),
    );
  }

  Widget _buildUI(OtpController otpController) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.blockSizeVertical * 4),
        const CustomBackButton(),
        SizedBox(height: SizeConfig.blockSizeVertical * 2),
        _buildOtpSvg(),
        SizedBox(height: SizeConfig.blockSizeVertical * 4),
        _buildInstructionText(),
        SizedBox(height: SizeConfig.blockSizeVertical * 4),
       _buildOtpFormContainer(otpController),
      ],
    );
  }

  Widget _buildOtpSvg() {
    return SvgPicture.asset(
      TImages.otpImage,
      height: SizeConfig.blockSizeVertical * 16,
    );
  }

  Widget _buildInstructionText() {
    return Text(
      'Please enter the OTP sent to your\nmobile number ending with (***142)',
      textAlign: TextAlign.center,
      style: AppTextStyle.commonTextStyle4()
    );
  }

  Widget _buildOtpFormContainer(OtpController otpController) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeConfig.blockSizeVertical * 8),
          ),
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 3),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: SizeConfig.blockSizeVertical * 10),
                OtpInputField(otpController: otpController), 
                SizedBox(height: SizeConfig.blockSizeVertical * 5),
                _buildResendSection(otpController),
                SizedBox(height: SizeConfig.blockSizeVertical * 6),
                _buildSubmitButton(otpController),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResendSection(OtpController otpController) {
    return Column(
      children: [
        Text(
          "Didn't receive an OTP ?",
          style: AppTextStyle.commonTextStyle10().copyWith(color: AppColors.lightGreyColor)
        ),
        SizedBox(height: SizeConfig.blockSizeVertical * 1),
        GestureDetector(
          onTap: () => otpController.resendOtp(),
          child: Text(
            'Resend OTP',
            style: AppTextStyle.commonTextStyle6()
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(OtpController otpController){
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 14,
      ),
      child: CustomElevatedButton(
        text: 'Submit',
        onPressed: () {
          if (otpController.validateOtp()) {
            String? otp = otpController.getOtp();
            THelperFunctions.showSnackBar('OTP is valid: $otp');
            // Proceed with OTP submission
            Get.offAllNamed(Routes.homePage,);

          } else {
            // Display error if OTP is invalid
            //Utils.snackBar('Please enter a valid OTP', Get.context!);
          }
        },
      ),
    );
  }

}
