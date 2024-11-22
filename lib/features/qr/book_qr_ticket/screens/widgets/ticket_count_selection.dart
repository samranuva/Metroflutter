import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/controllers/qr_ticket_booking_controller.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/screens/widgets/passenger_counter_button.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';


class TicketCountSelection extends StatelessWidget {
  const TicketCountSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = QRTicketBookingController.instance;
    //final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Number of Travellers', style: AppTextStyle.commonTextStyle14()),
        SizedBox(height: SizeConfig.blockSizeVertical * 1.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(TImages.personIcon, height: SizeConfig.blockSizeHorizontal * 5),
            SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
            _buildPassengerDetails(),
            const Spacer(),
            _buildPassengerAdjustButtons(context, controller),
          ],
        ),
      ],
    );
  }


  Widget _buildPassengerDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Passenger', style: AppTextStyle.commonTextStyle14()),
        Text('(Max upto 6 )', style: AppTextStyle.commonTextStyle7()),
      ],
    );
  }

  Widget _buildPassengerAdjustButtons(BuildContext context, QRTicketBookingController controller) {
    return Obx(
      () => Row(
        children: [
          // Decrease button
          PassengerCounterButton(
            icon: Icons.remove,
            onPressed: () {
              if (controller.validateStations()) {
                controller.updatePassengerCount(controller.passengerCount.value - 1);
              }
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 3.5),
            child: Text(
              controller.passengerCount.value.toString(),
              style: AppTextStyle.commonTextStyle2(),
            ),
          ),
          // Increase button
          PassengerCounterButton(
            icon: Icons.add,
            onPressed: () {
              if (controller.validateStations()) {
                controller.updatePassengerCount(controller.passengerCount.value + 1);
              }
            },
          ),
        ],
      ),
    );
  }

}
