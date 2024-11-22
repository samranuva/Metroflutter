import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/routes/routes.dart';
import 'package:t_savaari/utils/helpers/helper_functions.dart';

class RegistrationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController dobController = TextEditingController();

  RxString fullName = ''.obs;
  RxString mobileNumber = ''.obs;
  var selectedGender = RxnString(null);
  RxBool agreedToTerms = false.obs;


  void setDateOfBirth(DateTime date) {
    dobController.text = "${date.day}-${date.month}-${date.year}";
  }

  void toggleAgreement(bool? value) {
    agreedToTerms.value = value ?? false;
  }


  // Validation methods..
  String? validateFullName(String? value) {
    return value == null || value.trim().isEmpty
        ? 'Please enter your full name'
        : null;
  }


  String? validateGender(String? value) {
    return value == null || value.isEmpty ? 'Please select your gender' : null;
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void onTapRegister() {
    if (validateForm()) {
      if (!agreedToTerms.value) {
        THelperFunctions.showSnackBar('You must agree to the Terms & Conditions');
      } else {
        Get.toNamed(Routes.otpPage);
      }
    }
  }


  void navigateToLoginPage() {
    selectedGender.value = null;
    dobController.clear();
    agreedToTerms.value = false;

    Get.offAllNamed(Routes.loginPage);
  }


}
