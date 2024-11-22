import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_savaari/features/authentication/login/controllers/login_controller.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/custom_textfield.dart';
import 'package:t_savaari/utils/constants/colors.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/utils/validators/validation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); 
    final loginController = Get.put(LoginController());

    return Scaffold(
      body: buildUI(loginController),
    );
  }

  Widget buildUI(LoginController loginController) {
    return Stack(
      children: [
        _buildBackgroundImage(),
        //_buildLogo(),
        _buildLoginForm(loginController),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      alignment: Alignment.topCenter,
      TImages.loginBg,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  // Logo Positioned at the top-right corner
  Widget _buildLogo() {
    return Positioned(
      right: SizeConfig.blockSizeHorizontal * 10,
      top: SizeConfig.blockSizeVertical * 5,
      child: Container(
        padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.8),
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: Image.asset(
            TImages.hydMetroLogo,
            fit: BoxFit.cover,
            height: SizeConfig.blockSizeHorizontal * 38,
            width: SizeConfig.blockSizeHorizontal * 38,
          ),
        ),
      ),
    );
  }

  // Main Login Form
  Widget _buildLoginForm(LoginController loginController) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeHorizontal * 24,
        right: SizeConfig.blockSizeHorizontal * 10,
      ),
      child: Form(
        key: loginController.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.blockSizeVertical * 35),
            _buildLoginTitle(),
            SizedBox(height: SizeConfig.blockSizeVertical * 3),
            _buildMobileNumberField(loginController),
            SizedBox(height: SizeConfig.blockSizeVertical * 8),
            _buildLoginButton(loginController),
            SizedBox(height: SizeConfig.blockSizeVertical * 4),
            _buildSignUpPrompt(loginController),
          ],
        ),
      ),
    );
  }


  // Login Title
  Widget _buildLoginTitle() {
    return Text(
      'Login',
      style: AppTextStyle.loginTextStyle(),
    );
  }

  // Mobile Number Input Field
  Widget _buildMobileNumberField(LoginController loginController) {
    return CustomTextField(
      labelText: 'Mobile Number',
      keyboardType: TextInputType.number,
      onChanged: loginController.onMobileNumberChanged,
      maxLength: 10,
      validator: TValidator.validatePhoneNumber,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }


  // Widget _buildLoginButton(LoginController loginController) {
  //   return CustomElevatedButton(
  //     text: 'Login',
  //     onPressed: () => loginController.onTapLogin(),
  //   );
  // }

  Widget _buildLoginButton(LoginController loginController) {
    return Obx(() {
      return SizedBox(
        width: double.infinity, 
        height: SizeConfig.blockSizeVertical * 5,
        child: ElevatedButton(
          onPressed: loginController.isLoading.value ? null : loginController.login,
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: loginController.isLoading.value
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(TColors.primary),
                )
              : Text(
                'Login',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.blockSizeHorizontal * 4, // Text size
                  ),
                ),
        ),
      );
    });
  }



  Widget _buildSignUpPrompt(LoginController loginController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ", style: AppTextStyle.commonTextStyle2()),
        GestureDetector(
          onTap: loginController.navigateToRegisterPage,
          child: Text(
            'Sign up',
            style: AppTextStyle.commonTextStyle1().copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }

}
