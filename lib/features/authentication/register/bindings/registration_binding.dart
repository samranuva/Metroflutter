import 'package:get/get.dart';
import 'package:t_savaari/features/authentication/register/controllers/registration_controller.dart';

class RegistrationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(() => RegistrationController());
  }
}