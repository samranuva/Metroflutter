import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';

class MetroNetworkMapController extends GetxController {
  late PdfControllerPinch pdfPinchController;

  @override
  void onInit() {
    super.onInit();
    pdfPinchController = PdfControllerPinch(
      document: PdfDocument.openAsset(TImages.metroNetworkMapPdf),
    );
  }

  @override
  void onClose() {
    pdfPinchController.dispose();
    super.onClose();
  }
}
