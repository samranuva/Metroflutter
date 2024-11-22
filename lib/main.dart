import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_savaari/app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:t_savaari/data/repositories/authentication/authenticaion_repository.dart';


void main() async {
   //Add Widgets Binding
  final WidgetsBinding widgetsBinding = 
      WidgetsFlutterBinding.ensureInitialized();

  //Initialize local storage
  await GetStorage.init();

  // Await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Get.put(AuthenticationRepository());

  // Restrict to portrait mode only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const App());
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const App(),
  //   ),
  // );
}



// Fin@88800