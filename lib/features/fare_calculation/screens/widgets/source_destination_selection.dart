import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/components/searchable_dropdown.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/controllers/station_list_controller.dart';
import 'package:t_savaari/features/fare_calculation/controllers/fare_calculation_controller.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/utils/loaders/shimmer_effect.dart';


class SourceDestinationSelection extends StatelessWidget {
  const SourceDestinationSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = StationListController.instance;
    final fareCalculationController = FareCalculationController.instance;

    return Obx(
      ()=> Column(
        children: [
          if (controller.isLoading.value)
            const ShimmerEffect(
              width: double.infinity,
              height: 50,
            )
          else
            CustomSearchableDropdown(
              //items: stations..sort(),
              items: controller.stationList
                  .map((item) => item.name!)
                  .toList()
                ..sort(),  
              labelText: 'Starting from?',
              onChanged: (String? newValue) {
                fareCalculationController.source.value = newValue!;
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9\s]*$')), // Allow letters, numbers, and spaces
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeHorizontal * 2),
              child: SvgPicture.asset(
                TImages.bookTicketReverseIcon,
                height: SizeConfig.blockSizeHorizontal * 10,
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
              items: controller.stationList
                  .map((item) => item.name!)
                  .toList()
                ..sort(),  
              labelText: 'Going to?',
              onChanged: (String? newValue) {
                fareCalculationController.destination.value = newValue!;
                fareCalculationController.getFare();
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9\s]*$')), // Allow letters, numbers, and spaces
              ],
            ),
        ],
      ),
    );
    
  }
}
