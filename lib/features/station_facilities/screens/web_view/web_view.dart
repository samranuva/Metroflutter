import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/features/station_facilities/screens/web_view/controllers/web_view_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class WebViewScreen extends GetView<WebScreenController> {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WebScreenController());
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CommonAppBar(title: "Station Facilities"),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Obx(() {
      if (controller.contentUrl?.value == null || controller.contentUrl!.value.isEmpty) {
        return Center(
          child: Text(
            'No information available for this station',
            style: AppTextStyle.commonTextStyle18().copyWith(
              color: AppColors.greyColor,
            ),
          ),
        );
      }

      return Stack(
        children: [
          WebViewWidget(
            controller: controller.webViewController,
          ),
          if (controller.isLoading.value)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      );
    });
  }
}