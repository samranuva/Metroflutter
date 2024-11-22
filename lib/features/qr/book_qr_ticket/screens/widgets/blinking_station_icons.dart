// blinking_icons.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/controllers/qr_ticket_booking_controller.dart';

class BlinkingIcons extends StatelessWidget {
  final QRTicketBookingController controller;
  final String? fromStation;
  final String? toStation;

  const BlinkingIcons({
    super.key,
    required this.controller,
    required this.fromStation,
    required this.toStation
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 4),
      child: Column(
        children: [
          // From Station Icon (Blinks if `fromStation` is null or empty)
          Obx(() => AnimatedOpacity(
                opacity: controller.isVisibleFrom.value ? 1.0 : 0.1,
                duration: const Duration(milliseconds: 500),
                child: SvgPicture.asset(
                  TImages.greenCircleIcon,
                  height: SizeConfig.blockSizeHorizontal * 6,
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 0),
            child: SvgPicture.asset(
              TImages.routeIcon,
              height: SizeConfig.blockSizeHorizontal * 15,
            ),
          ),
          // To Station Icon (Blinks if `toStation` is null or empty)
          Obx(() => AnimatedOpacity(
                opacity: controller.isVisibleTo.value ? 1.0 : 0.1,
                duration: const Duration(milliseconds: 500),
                child: SvgPicture.asset(
                  TImages.redCircleIcon,
                  height: SizeConfig.blockSizeHorizontal * 6,
                ),
              )),
        ],
      ),
    );
  }
}
