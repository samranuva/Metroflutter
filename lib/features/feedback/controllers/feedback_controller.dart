import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_savaari/utils/helpers/helper_functions.dart';

class FeedbackController extends GetxController {
  static FeedbackController get instance => Get.find();

  final ImagePicker _picker = ImagePicker();
  Rx<String?> attachmentName = Rx<String?>(null);

  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      attachmentName.value = File(pickedFile.path).path.split('/').last;
    }
  }

  void clearAttachment() {
    attachmentName.value = null;
    Get.back();
  }

  void submitFeedback() {
    // Add feedback submission logic here
    THelperFunctions.showSnackBar('Feedback has been sent successfully!');
  }
}
