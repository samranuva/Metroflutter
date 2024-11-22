import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/components/circular_container.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/controllers/station_list_controller.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/screens/widgets/source_destination_selection.dart';
import 'package:t_savaari/common/components/custom_back_button.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/screens/widgets/ticket_count_selection.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/screens/widgets/ticket_type_selection.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/controllers/qr_ticket_booking_controller.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/screens/widgets/blinking_station_icons.dart';


class QRTicketBookingScreen extends GetView<QRTicketBookingController> {
  const QRTicketBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final qRTicketBookingController = Get.put(QRTicketBookingController());
    Get.put(StationListController());

    SizeConfig.init(context);

    return Scaffold(
      body: _buildUI(context, qRTicketBookingController),
    );
  }

  Widget _buildUI(BuildContext context, QRTicketBookingController qRTicketBookingController) {
    return Stack(
      children: [
        _buildBackgroundImage(),
        SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(
                onPressed: () {
                  //qRTicketBookingController.resetFields();
                  Get.back();
                },
              ),
              _buildHeader(),
              _buildBookingCard(context, qRTicketBookingController),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      height: SizeConfig.blockSizeVertical * 40,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(TImages.bookTicketBgImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical * 2,
          horizontal: SizeConfig.blockSizeHorizontal * 5,
        ),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Let's\n",
                style: AppTextStyle.bookTicketHeadingTextStyle(),
              ),
              TextSpan(
                text: "Book Your\nTicket",
                style: AppTextStyle.bookTicketHeadingTextStyle1(),
              ),
            ],
          ),
          textWidthBasis: TextWidthBasis.parent,
        ),
      ),
    );
  }

  Widget _buildBookingCard(BuildContext context, QRTicketBookingController qRTicketBookingController) {
    return Flexible(
      fit: FlexFit.loose,
      child: CircularContainer(
        radius: 16,
        margin: EdgeInsets.all(
          SizeConfig.blockSizeHorizontal * 5,
        ),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStationSelector(qRTicketBookingController),
              SizedBox(height: SizeConfig.blockSizeVertical * 3.5),
              const TicketCountSelection(),
              SizedBox(height: SizeConfig.blockSizeVertical * 3),
              const TicketTypeSelection(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildStationSelector(QRTicketBookingController qRTicketBookingController) {
    return Row(
      children: [
        BlinkingIcons(
          controller: qRTicketBookingController,
          fromStation: qRTicketBookingController.source.value,
          toStation: qRTicketBookingController.destination.value,
        ),
        const QRSourceDestinationSelection(),
      ],
    );
  }

}
