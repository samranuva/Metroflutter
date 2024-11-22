import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/custom_drop_down.dart';
import 'package:t_savaari/common/components/custom_elevated_button.dart';
import 'package:t_savaari/common/components/custom_textfield.dart';
import 'package:t_savaari/utils/constants/colors.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/authentication/register/controllers/registration_controller.dart';
import 'package:t_savaari/utils/validators/validation.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegistrationController controller = Get.put(RegistrationController());
    SizeConfig.init(context);

    return Scaffold(
      body: _buildUI(controller, context),
    );
  }

  Widget _buildUI(RegistrationController controller, BuildContext context) {
    return Stack(
      children: [
        _buildBackgroundImage(),
        //_buildLogo(),
        _buildRegistrationForm(controller),
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

  Widget _buildRegistrationForm(RegistrationController controller) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeHorizontal * 24,
        right: SizeConfig.blockSizeHorizontal * 10,
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.blockSizeVertical * 30),
            _buildTitle(),
            SizedBox(height: SizeConfig.blockSizeVertical * 1.5),
            _buildFullNameField(controller),
            SizedBox(height: SizeConfig.blockSizeVertical * 1),
            _buildMobileNumberField(controller),
            SizedBox(height: SizeConfig.blockSizeVertical * 1),
            _buildDateOfBirthField(controller),
            SizedBox(height: SizeConfig.blockSizeVertical * 1),
            _buildGenderDropdown(controller),
            SizedBox(height: SizeConfig.blockSizeVertical * 2),
            _buildTermsAndConditions(controller),
            SizedBox(height: SizeConfig.blockSizeVertical * 4),
            _buildRegisterButton(controller),
            SizedBox(height: SizeConfig.blockSizeVertical * 4),
            _buildLoginPrompt(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Registration',
      style: AppTextStyle.loginTextStyle(),
    );
  }

  Widget _buildFullNameField(RegistrationController controller) {
    return CustomTextField(
      labelText: 'Full Name',
      keyboardType: TextInputType.text,
      onChanged: (value) => controller.fullName.value = value,
      validator: controller.validateFullName,
      isRequired: true,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]*$')), // Allow only letters and spaces
      ],
    );
  }

  Widget _buildMobileNumberField(RegistrationController controller) {
    return CustomTextField(
      labelText: 'Mobile Number',
      keyboardType: TextInputType.number,
      maxLength: 10,
      onChanged: (value) => controller.mobileNumber.value = value,
      validator: TValidator.validatePhoneNumber,
      isRequired: true,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }

  Widget _buildDateOfBirthField(RegistrationController controller) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: Get.context!,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) controller.setDateOfBirth(pickedDate);
      },
      child: AbsorbPointer(
        child: CustomTextField(
          labelText: 'Date Of Birth',
          keyboardType: TextInputType.datetime,
          controller: controller.dobController,
          validator: (value) => value == null || value.isEmpty
              ? 'Please enter your date of birth'
              : null,
          isRequired: true,
        ),
      ),
    );
  }
  

  Widget _buildGenderDropdown(RegistrationController controller) {
    return CustomDropdown(
      labelText: 'Gender',
      value: controller.selectedGender.value,
      items: const [
        DropdownMenuItem(child: Text("Male"), value: "Male"),
        DropdownMenuItem(child: Text("Female"), value: "Female"),
        DropdownMenuItem(child: Text("Other"), value: "Other"),
      ],
      onChanged: (value) => controller.selectedGender.value = value,
      validator: controller.validateGender,
      isRequired: true,
    );
  }

  Widget _buildTermsAndConditions(RegistrationController controller) {
    return Row(
      children: [
        Obx(() => Checkbox(
              checkColor: AppColors.whiteColor,
              activeColor: TColors.primary,
              value: controller.agreedToTerms.value,
              onChanged: controller.toggleAgreement,
            )),
        Text("Agree With ", style: AppTextStyle.commonTextStyle1()),
        GestureDetector(
          onTap: () {
            // Navigate to Terms & Conditions
          },
          child: Text(
            "Terms & Conditions",
            style: AppTextStyle.commonTextStyle1().copyWith(color: AppColors.primaryColor)),
        ),
      ],
    );
  }

  Widget _buildRegisterButton(RegistrationController controller) {
    return CustomElevatedButton(
      text: 'Register',
      onPressed: () => controller.onTapRegister(),
    );
  }

  Widget _buildLoginPrompt(RegistrationController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account? ", style: AppTextStyle.commonTextStyle2()),
        GestureDetector(
          onTap: () => controller.navigateToLoginPage(),
          child: Text(
            'Login',
            style: AppTextStyle.commonTextStyle1().copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
