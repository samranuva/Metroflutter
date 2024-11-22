import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/routes/routes.dart';
import 'package:t_savaari/utils/helpers/helper_functions.dart';

class ViewBalanceOrRechargeController extends GetxController {
  final TextEditingController cardNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();

  // Define the validation logic
  String? validateInputs(BuildContext context) {
    if (cardNameController.text.isEmpty) {
      return 'Card name is required to proceed.';
    } else if (cardNumberController.text.isEmpty) {
      return 'Please enter your card number to continue.';
    } else if (cardNumberController.text.length < 14) {
      return 'Card number must be 14 digits long.';
    }
    return null;
  }

  // Handle Save and Recharge button tap
  void onTapSaveAndRechargeButton(BuildContext context) {
    final validationError = validateInputs(context);
    if (validationError != null) {
      THelperFunctions.showSnackBar(validationError);
    } else {
      // Navigate to the next page
      Get.toNamed(Routes.viewBalanceRechargeInfoPage);
    }
  }

  @override
  void onClose() {
    cardNameController.dispose();
    cardNumberController.dispose();
    super.onClose();
  }
}
