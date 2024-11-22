import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/authentication/otp/controllers/otp_controller.dart';

class OtpInputField extends StatelessWidget {
  final OtpController otpController;

  const OtpInputField({
    super.key, 
    required this.otpController,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Form(
      key: otpController.formKey, 
      child: Pinput(
        length: 6,
        //obscureText: true,
        closeKeyboardWhenCompleted: true,
        //obscuringCharacter: "*",
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        defaultPinTheme: PinTheme(
          height: SizeConfig.blockSizeVertical * 5.5, 
          width: SizeConfig.blockSizeHorizontal * 12, 
          textStyle: TextStyle(
            fontSize: SizeConfig.blockSizeHorizontal * 5, 
            color: AppColors.blackColor, 
            fontWeight: FontWeight.w600,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), 
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.lightGreyColor.withOpacity(0.5), 
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // Shadow position
              ),
            ],
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the OTP';
          } else if (value.length != 6) {
            return 'OTP should be 6 digits';
          }
          return null; 
        },
        onChanged: (value) {
          otpController.updateOtpCode(value);
        },
        
        // Add an onSubmitted callback if you want to handle submission
        onSubmitted: (value) {
          otpController.validateOtp();
        },
        // submittedPinTheme: PinTheme(
        //   height: SizeConfig.blockSizeVertical * 6,
        //   width: SizeConfig.blockSizeHorizontal * 15,
        //   textStyle: TextStyle(
        //     fontSize: SizeConfig.blockSizeHorizontal * 6,
        //     color: const Color.fromARGB(255, 41, 124, 44), // Change text color for error state
        //     fontWeight: FontWeight.w600,
        //   ),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(12),
        //     color: AppColors.whiteColor,
        //     border: Border.all(color: const Color.fromARGB(255, 41, 124, 44),), // Border color for error
        //   ),
        // ),
      
        errorTextStyle: TextStyle(
            fontSize: SizeConfig.blockSizeHorizontal * 3.3,
            color: AppColors.redColor, // Change text color for error state
            fontWeight: FontWeight.w600,
          ),
        // Customize the error theme
        errorPinTheme: PinTheme(
          height: SizeConfig.blockSizeVertical * 5.5, // Height of each pin field
          width: SizeConfig.blockSizeHorizontal * 12, // Width of each pin field
          textStyle: TextStyle(
            fontSize: SizeConfig.blockSizeHorizontal * 5,
            color: AppColors.redColor, // Change text color for error state
            fontWeight: FontWeight.w600,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.redColor,), // Border color for error
          ),
        ),
      ),
    );
  }

}
