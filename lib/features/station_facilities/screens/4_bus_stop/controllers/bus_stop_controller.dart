import 'package:get/get.dart';

class BusStopController extends GetxController {
  // Reactive variable for selected gate
  var selectedGate = 'Gate A'.obs;

  // Available gates
  final List<String> gates = ['Gate A', 'Gate B'];

  // Bus numbers data
  final List<String> busNumbersRow1 = ['150', '280', '113K', '71A', '113Y', '115'];
  final List<String> busNumbersRow2 = ['115', '71A', '284Y', '113M', '113Y', '115', '284Y', '113M', '113Y', '115'];

  // Method to update the selected gate
  void updateGate(String gate) {
    selectedGate.value = gate;
  }
}
