import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/bindings/general_bindings.dart';
import 'package:t_savaari/routes/app_routes.dart';
import 'package:t_savaari/routes/routes.dart';
import 'package:t_savaari/utils/constants/text_strings.dart';
import 'package:t_savaari/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      // theme: TAppTheme.lightTheme,
      // darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,

      //Show Loader or circular progress indicator meanwhile authentication service is
      //deciding to show releveant screen
      //home: const LoginScreen(),
      initialRoute: Routes.loginPage,
    );
  }
}