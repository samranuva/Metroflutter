import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/components/custom_elevated_button.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/controllers/qr_ticket_booking_controller.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class ProceedToPayBtn extends StatelessWidget {
  const ProceedToPayBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bookQrController = QRTicketBookingController.instance;

    return Obx(
      () {
        // Check if fare data is available
        final fare = bookQrController.qrFareData.isNotEmpty
            ? (bookQrController.qrFareData.first.finalFare ?? 0)
            : null;

        final totalAmount = fare != null
            ? bookQrController.passengerCount.value * fare
            : null;

        return CustomElevatedButton(
          height: SizeConfig.blockSizeVertical * 5.5,
          text: totalAmount != null
              ? 'Proceed to Pay  \u{20B9}$totalAmount/-'
              : 'Proceed to Pay', 
          onPressed: () {
            if (bookQrController.validateStations()) {
              // bookQrController.generateTicket();
            }
          },
        );
      },
    );
  }
}
