import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_savaari/data/repositories/authentication/authenticaion_repository.dart';
import 'package:t_savaari/routes/routes.dart';
import 'package:t_savaari/utils/helpers/network_manager.dart';
import 'package:t_savaari/utils/popups/loaders.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxString  mobileNumber = ''.obs;
  RxBool isLoading = false.obs;
  

  void onMobileNumberChanged(String value) {
    mobileNumber.value = value;
  }

   //Variables
  final deviceStorage = GetStorage();

  Future<void> login() async {
    try {
      //Loading
      isLoading.value = true;  
      // TFullScreenLoader.openLoadingDialog(
      //     'Logging you in', TImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Stop Loading
        //TFullScreenLoader.stopLoading();
        TLoaders.customToast(message: 'No Internet Connection');
        isLoading.value = false;
        return;
      }

      //Form Validation
      if (!formKey.currentState!.validate()) {
        //Stop Loading
        //TFullScreenLoader.stopLoading();
        isLoading.value = false;
        return;
      }

      //Login user using mobile authentication
      final response = await AuthenticationRepository.instance.login();

      // Save tokens in local storage
      await deviceStorage.write('access_token', response.accessToken);
      await deviceStorage.write('refresh_token', response.refreshToken);

      //Stop Loading
      //TFullScreenLoader.stopLoading();
      isLoading.value = false;

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (error) {
      //Stop Loading
      //TFullScreenLoader.stopLoading();
      isLoading.value = false;
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: error.toString());
    }
  }

  // void onTapLogin() {
  //   if (formKey.currentState!.validate()) {
  //     Get.toNamed(Routes.otpPage);
  //   }
  // }


  void navigateToRegisterPage() {
    Get.offAllNamed(Routes.registrationPage);
  }
}
