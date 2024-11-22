import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/controllers/qr_ticket_booking_controller.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/screens/widgets/journey_option_card.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/screens/widgets/proceed_to_pay_btn.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class TicketTypeSelection extends StatelessWidget {
  const TicketTypeSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = QRTicketBookingController.instance;

    return Expanded(
      child: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // Display price as 0 if qrFareData is empty
            final singleTripPrice = controller.qrFareData.isNotEmpty
                ? (controller.qrFareData.first.finalFare ?? 0)
                : 0;

            final roundTripPrice = singleTripPrice * 2;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Journey Trip', style: AppTextStyle.commonTextStyle14()),
                SizedBox(height: SizeConfig.blockSizeVertical * 1.5),
                Row(
                  children: [
                    JourneyOptionCard(
                      label: 'Single Trip',
                      price: singleTripPrice, 
                      isSelected: !controller.ticketType.value,
                      onTap: () {
                        controller.selectTripType(false);
                        controller.getFare();
                      },
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 8),
                    JourneyOptionCard(
                      label: 'Round Trip',
                      price: roundTripPrice, 
                      isSelected: controller.ticketType.value,
                      onTap: () {
                        controller.selectTripType(true);
                        controller.getFare();
                      },
                    ),
                  ],
                ),
                const Spacer(),
                const ProceedToPayBtn()
              ],
            );
          }
        },
      ),
    );
  }
}
