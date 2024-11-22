import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/utils/helpers/helper_functions.dart';

class OtpController extends GetxController {
  // Reactive variables
  RxString otpCode = ''.obs;
  RxBool isOtpValid = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Method to validate OTP
  bool validateOtp() {
    isOtpValid.value = formKey.currentState?.validate() ?? false;
    return isOtpValid.value;
  }

  // Method to get OTP value
  String? getOtp() => otpCode.value;

  // Method to update OTP code from the UI
  void updateOtpCode(String? value) {
    otpCode.value = value ?? '';
  }

  // Method to resend OTP
  void resendOtp() {
    // Add logic to resend OTP here
    THelperFunctions.showSnackBar('OTP has been resent successfully!');
  }
  
}
