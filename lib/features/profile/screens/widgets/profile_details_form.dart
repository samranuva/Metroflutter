import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/components/custom_drop_down.dart';
import 'package:t_savaari/common/components/custom_elevated_button.dart';
import 'package:t_savaari/common/components/custom_textfield.dart';
import 'package:t_savaari/features/profile/controllers/profile_controller.dart';
import 'package:t_savaari/features/profile/screens/widgets/edit_mobile_no_confirmation_dialog.dart';
import 'package:t_savaari/routes/routes.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/utils/helpers/helper_functions.dart';

class ProfileDetailsForm extends StatelessWidget {
   ProfileDetailsForm({super.key});

  final profileController = ProfileController.instance;

  @override
  Widget build(BuildContext context) {
    return _buildProfileDetailsForm(context);
  }


  Widget _buildProfileDetailsForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 2,
        left: SizeConfig.blockSizeHorizontal * 12,
        right: SizeConfig.blockSizeHorizontal * 12,
      ),
      child: Form(
        key: profileController.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFullNameField(),
            SizedBox(height: SizeConfig.blockSizeVertical * 1),
            _buildMobileNumberField(context),
            SizedBox(height: SizeConfig.blockSizeVertical * 1),
            _buildDateOfBirthField(context),
            SizedBox(height: SizeConfig.blockSizeVertical * 1),
            _buildEmailField(),
            SizedBox(height: SizeConfig.blockSizeVertical * 1),
            _buildGenderDropdown(),
            SizedBox(height: SizeConfig.blockSizeVertical * 16),
            _buildUpdateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildFullNameField() {
    return CustomTextField(
      labelText: 'Full Name',
      keyboardType: TextInputType.text,
      controller: profileController.fullNameController,
      onChanged: (value) => profileController.fullNameController.text = value,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your full name';
        }
        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]*$')), // Allow only letters and spaces
      ],
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      labelText: 'Email',
      keyboardType: TextInputType.emailAddress,
      controller: profileController.emailController,
      onChanged: (value) => profileController.emailController.text = value,
      validator: (value) {
        if (value == null || value.trim().isEmpty || !value.contains('@') || !value.contains('.com')) {
          return 'Please enter valid email address';
        }
        return null;
      },
      inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]')),
    ],
    );
  }

  Widget _buildMobileNumberField(BuildContext context) {
    return Stack(
      children: [
        Obx(
          ()=> CustomTextField(
            labelText: 'Mobile Number',
            keyboardType: TextInputType.number,
            controller: profileController.mobileNumberController,
            enabled: profileController.isMobileNumberEditable.value,
            maxLength: 10,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your mobile number';
              } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                return 'Mobile number must be 10 digits';
              }
              return null;
            },
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        Positioned(
          bottom: SizeConfig.blockSizeVertical * 1,
          right: 0,
          child: GestureDetector(
            onTap: () {
              // Show confirmation dialog
              const EditConfirmationDialog().showEditMobileNoConfirmationDialog(context);
            },
            child: SvgPicture.asset(
              TImages.editIcon,
              height: SizeConfig.blockSizeHorizontal * 4,
            ),
          ),
        ),
      ]
    );
  }



  Widget _buildDateOfBirthField(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );


        if (pickedDate != null) {
          profileController.dobController.text = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
        }
      },
      child: AbsorbPointer(
        child: CustomTextField(
          labelText: 'Date Of Birth',
          keyboardType: TextInputType.datetime,
          controller: profileController.dobController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your date of birth';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Obx(
      ()=> CustomDropdown(
        labelText: 'Gender',
        value: profileController.selectedGender.value,
        items: const [
          DropdownMenuItem(child: Text("Male"), value: "Male"),
          DropdownMenuItem(child: Text("Female"), value: "Female"),
          DropdownMenuItem(child: Text("Other"), value: "Other"),
        ],
        onChanged: (value) => profileController.selectedGender.value = value!,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select your gender';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildUpdateButton() {
    return Align(
      child: CustomElevatedButton(
        text: 'Update',
        onPressed: () {
          if (profileController.formKey.currentState!.validate()) {
            if (profileController.mobileNumberController.text != profileController.originalMobileNumber) {
              // Navigate to OTP screen if mobile number was changed
              Get.toNamed(Routes.otpPage);
            } else {
              // Show a snackbar message if mobile number wasn't changed
              THelperFunctions.showSnackBar('Your profile updated!');
            }
          }
        },
      ),
    );
  }
 
}