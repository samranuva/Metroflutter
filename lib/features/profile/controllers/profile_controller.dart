import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find(); 
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();

  RxString selectedGender = ''.obs;
  RxBool isMobileNumberEditable = false.obs;
  Rx<File?> profileImage = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();

  String originalMobileNumber = '';

  @override
  void onInit() {
    super.onInit();
    _populateDummyData();
  }

  void _populateDummyData() {
    fullNameController.text = 'Sam Ranuva';
    mobileNumberController.text = '9876543210';
    emailController.text = 'sam.034@gmail.com';
    dobController.text = '01-01-1990';
    selectedGender.value = 'Male';
    originalMobileNumber = mobileNumberController.text;
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
      sendImageToServer(profileImage.value!);
    }
  }

  Future<void> sendImageToServer(File image) async {
    const String apiUrl = 'https://api.example/';
    try {
      final request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(await http.MultipartFile.fromPath('profile_image', image.path));

      final response = await request.send();
      if (response.statusCode == 200) {
        print('Profile picture uploaded successfully');
      } else {
        print('Failed to upload profile picture');
      }
    } catch (e) {
      print('Error uploading profile picture: $e');
    }
  }

  void deleteImage() {
    profileImage.value = null;
    sendDeleteImageRequest();
  }

  Future<void> sendDeleteImageRequest() async {
    const String apiUrl = 'https://api.example';
    try {
      final response = await http.delete(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        print('Profile picture deleted successfully');
      } else {
        print('Failed to delete profile picture');
      }
    } catch (e) {
      print('Error deleting profile picture: $e');
    }
  }

  void toggleMobileNumberEdit() {
    isMobileNumberEditable.value = !isMobileNumberEditable.value;
  }
}
