import 'package:get/get.dart';
import 'package:t_savaari/features/authentication/otp/controllers/otp_controller.dart';

class OtpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
}