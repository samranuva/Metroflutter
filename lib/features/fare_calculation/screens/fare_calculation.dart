import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/controllers/station_list_controller.dart';
import 'package:t_savaari/features/fare_calculation/screens/widgets/source_destination_selection.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/common/components/custom_elevated_button.dart';
import 'package:t_savaari/common/components/dashed_line.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/routes/routes.dart';
import 'package:t_savaari/features/fare_calculation/controllers/fare_calculation_controller.dart';

class FareCalculationScreen extends GetView<FareCalculationController> {
  const FareCalculationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FareCalculationController controller = Get.put(FareCalculationController());
    Get.put(StationListController());
    
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CommonAppBar(
        title: "Metro Fare Calculator",
        onTapBack: () {
          controller.resetFields();
          Get.back();
        },
      ),
      body:_buildFareCalculatorCard(context),
    );
  }

  

  Widget _buildFareCalculatorCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 5,
        vertical: SizeConfig.blockSizeVertical * 6,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 5,
                vertical: SizeConfig.blockSizeVertical * 5,
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Metro Fare Calculator", style: AppTextStyle.commonTextStyle9().copyWith(color: AppColors.blackColor)),
                  SizedBox(height: SizeConfig.blockSizeVertical * 3),
                  
                  //-- Source and Destination station selection
                  const SourceDestinationSelection(),
                  Obx(() {
                    if (controller.areStationsValid()) {
                      return _buildFareInfo();
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFareInfo() {
    return Column(
      children: [
        SizedBox(height: SizeConfig.blockSizeVertical * 4),
        _buildStationRow(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2),
          child: const DashedLine(length: double.infinity, isVertical: false),
        ),
        _buildFareAndDurationRow(),
        SizedBox(height: SizeConfig.blockSizeVertical * 3),
        _buildDistanceRow(),
        SizedBox(height: SizeConfig.blockSizeVertical * 10),
         _buildProceedButton(),
      ],
    );
  }

  Widget _buildStationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildStationColumn("Starting from", controller.source.value),
        Expanded(child: Icon(Icons.arrow_forward, size: SizeConfig.blockSizeHorizontal * 4)),
        _buildStationColumn("Going to", controller.destination.value),
      ],
    );
  }

  Widget _buildFareAndDurationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildFareOrDuration("Fare :", TImages.rupeesIcon, "30"),
        _verticalDivider(),
        _buildFareOrDuration("Duration :", TImages.durationIcon, "10Min"),
      ],
    );
  }

  Widget _buildDistanceRow() {
    return Row(
      children: [
        _buildFareOrDuration("Distance :", TImages.distanceIcon, "5.5KM"),
        Padding( 
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeVertical * 1.5),
          child: Container(),
        ),
        Expanded(child: Container()),
      ],
    );
  }

  Widget _buildStationColumn(String title, String? station) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.commonTextStyle16()),
          Text(station ?? "", style: AppTextStyle.commonTextStyle3()),
        ],
      ),
    );
  }

  Widget _buildFareOrDuration(String label, String iconPath, String value) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 1.5),
                child: SvgPicture.asset(iconPath, height: SizeConfig.blockSizeHorizontal * 4),
              ),
              Text(label, style: AppTextStyle.commonTextStyle2()),
            ],
          ),
          Text(value, style: AppTextStyle.commonTextStyle3()),
        ],
      ),
    );
  }

  Widget _buildProceedButton() {
    return CustomElevatedButton(
      height: SizeConfig.blockSizeVertical * 5.5,
      text: 'Book QR Ticket',
      onPressed: () {
        Get.toNamed(Routes.qrTicketBookingPage);
      },
    );
  }

  Widget _verticalDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeVertical * 1.5),
      child: Container(
        width: 1,
        height: SizeConfig.blockSizeVertical * 3.5,
        color: AppColors.lightGreyColor3,
      ),
    );
  }
}
