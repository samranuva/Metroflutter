import 'package:get/get.dart';  // Import GetX package

class ViewBalanceRechargeInfoController extends GetxController {

  Rxn<String> cardNumber = Rxn<String>();

  final List<String> cardNumbersList = ['10065789087744', '10065789087722', '10065789087754'];

  void setCardNumber(String? newCardNumber) {
    cardNumber.value = newCardNumber;
  }
}
