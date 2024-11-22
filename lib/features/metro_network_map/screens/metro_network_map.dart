import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/metro_network_map/controllers/metro_network_map_controller.dart';

class MetroNetworkMapScreen extends StatelessWidget {
  const MetroNetworkMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(MetroNetworkMapController());
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CommonAppBar(
        title: "Metro Network Map",
      ),
      body: _buildPdf(controller),
    );
  }

  Widget _buildPdf(MetroNetworkMapController controller) {
    return PdfViewPinch(
      padding: SizeConfig.blockSizeHorizontal * 5,
      controller: controller.pdfPinchController,
    );
  }
}
