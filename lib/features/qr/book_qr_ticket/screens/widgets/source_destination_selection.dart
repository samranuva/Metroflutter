import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/components/searchable_dropdown.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/controllers/qr_ticket_booking_controller.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/controllers/station_list_controller.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/utils/loaders/shimmer_effect.dart';


class QRSourceDestinationSelection extends StatelessWidget {
  const QRSourceDestinationSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = StationListController.instance;
    final bookQrController = QRTicketBookingController.instance;

    return Obx(
      ()=> Expanded(
        child: Column(
          children: [
            if (controller.isLoading.value)
              const ShimmerEffect(
                width: double.infinity,
                height: 50,
              )
            else
              CustomSearchableDropdown(
                //selectedItem: bookQrController.source.value,
                //items: stations..sort(),
                items: controller.stationList
                    .map((item) => item.name!)
                    .toList()
                  ..sort(),  
                labelText: 'Starting from?',
                onChanged: (String? newValue) {
                  bookQrController.source.value = newValue!;
                  bookQrController.getFare();
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9\s]*$')), // Allow letters, numbers, and spaces
                ],
              ),
              GestureDetector(
                onTap: () {  
                  // final temp = bookQrController.source.value;
                  // bookQrController.source.value =
                  //     bookQrController.destination.value;
                  // bookQrController.destination.value = temp;
                  // bookQrController.getFare();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeHorizontal * 2),
                  child: SvgPicture.asset(
                    TImages.bookTicketReverseIcon,
                    height: SizeConfig.blockSizeHorizontal * 10,
                  ),
                ),
              ),
            if (controller.isLoading.value)
              const ShimmerEffect(
                width: double.infinity,
                height: 50,
              )
            else
              CustomSearchableDropdown(
                //items: stations..sort(),
                //selectedItem: bookQrController.destination.value,
                items: controller.stationList
                    .map((item) => item.name!)
                    .toList()
                  ..sort(),  
                labelText: 'Going to?',
                onChanged: (String? newValue) {
                  bookQrController.destination.value = newValue!;
                  bookQrController.getFare();
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9\s]*$')), // Allow letters, numbers, and spaces
                ],

              ),
          ],
        ),
      ),
    );
    
  }
}
