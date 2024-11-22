import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:t_savaari/utils/helpers/helper_functions.dart';

class RechargeController extends GetxController {
  Rx<String?> cardNumber = Rx<String?>(null);
  Rx<String?> rechargeAmount = Rx<String?>(null);
  RxBool agreedToTerms = false.obs;

  // Update card number
  void setCardNumber(String? number) {
    cardNumber.value = number;
  }

  // Update recharge amount
  void setRechargeAmount(String? amount) {
    rechargeAmount.value = amount;
  }

  // Toggle agreement to terms
  void toggleAgreedToTerms(bool value) {
    agreedToTerms.value = value;
  }

  // Check if user can proceed with recharge
  bool canRecharge() {
    return cardNumber.value != null && rechargeAmount.value != null && agreedToTerms.value;
  }

  // Handle recharge action
  void recharge(BuildContext context) {
    if (canRecharge()) {
      THelperFunctions.showSnackBar('Proceeding with the payment...');
    }
  }

  // Reset the state
  void reset() {
    cardNumber.value = null;
    rechargeAmount.value = null;
    agreedToTerms.value = false;
  }
}
