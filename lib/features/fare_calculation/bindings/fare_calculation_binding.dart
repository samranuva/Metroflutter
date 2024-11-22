import 'package:get/get.dart';
import 'package:t_savaari/features/fare_calculation/controllers/fare_calculation_controller.dart';

class FareCalculationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<FareCalculationController>(() => FareCalculationController());
  }
}