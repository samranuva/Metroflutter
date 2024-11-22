import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_savaari/routes/routes.dart';
import 'package:t_savaari/utils/constants/api_constants.dart';
import 'package:t_savaari/utils/http/http_client.dart';
import 'package:t_savaari/features/authentication/login/models/token_model.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final deviceStorage = GetStorage();

  //Called from app.dart on app launch
  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    //screenRedirect();
  }

  //Function show relevant screen
  screenRedirect() {
    //final token = deviceStorage.read('token');
    final token = deviceStorage.read('access_token');
    if (token != null) {
      Get.toNamed(Routes.otpPage);
      //Get.offAll(() => const BottomNavigationMenu());
    } else {
      Get.offAllNamed(Routes.loginPage);
      //Get.offAll(() => const LoginScreen());
    }
  }

  Future<TokenModel> login() async {
    try {
      final data = await THttpHelper.get(
        'https://stage.tsavaari.com',
        ApiEndPoint.getToken,
      );
      return TokenModel.fromJson(data);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      print(e.toString());
      throw 'Something went wrong. Please try again later!';
    }
  }

  // Future<TokenModel> login() async {
  //   try {
  //     final loginPayload = {
  //       "username": "tsavaari_merchant",
  //       "password": "bckU*8aw4tqp@Hsc",
  //       "grant_type": 'password',
  //       "merchant_id": "5000886103344",
  //     };

  //     final data = await THttpHelper.post(
  //       'https://122.252.226.254:5101/api',
  //       'connect/token',
  //       loginPayload,
  //     );
  //     return TokenModel.fromJson(data);
  //   } on PlatformException catch (e) {
  //     throw PlatformException(code: e.code).message!;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again later!';
  //   }
  // }


}
