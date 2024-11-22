import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/features/station_facilities/controllers/station_facilities_controller.dart';
import 'package:t_savaari/features/station_facilities/models/station_facilities_services_model.dart';
import 'package:t_savaari/features/station_facilities/screens/widgets/near_by_facility_card.dart';
import 'package:t_savaari/features/station_facilities/screens/widgets/station_selection.dart';
import 'package:t_savaari/routes/routes.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/station_facilities/screens/station_facilities_dialog/station_facilities_dialog.dart';
import 'package:t_savaari/features/station_facilities/screens/widgets/station_facility_card.dart';

class StationFacilitiesScreen extends GetView<StationFacilitiesController> {
  const StationFacilitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StationFacilitiesController());
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CommonAppBar(title: "Station Facilities"),
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StationSelectionDropDown(),
          Obx(() {
            if (controller.nearestStation.value != null) {
              return _buildMetroStationFacilities(context);
            } else {
              return const SizedBox();
            }
          }),
        ],
      ),
    );
  }

  Widget _buildMetroStationFacilities(BuildContext context) {
    return Expanded(
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.stationFacilities.isEmpty) {
          return const Center(
            child: Text('No facilities available for the selected station.'),
          );
        }

        // Separate facilities by type
        final dialogFacilities = controller.stationFacilities
            .where((facility) => _isDialogFacility(facility))
            .toList();
        final screenFacilities = controller.stationFacilities
            .where((facility) => !_isDialogFacility(facility))
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Near by Facilities'),
            _buildHorizontalList(screenFacilities, context),
            _buildSectionTitle('Station Facilities'),
            Expanded(child: _buildVerticalList(dialogFacilities, context)),
          ],
        );
      }),
    );
  }

  Widget _buildHorizontalList(List<Facility> facilities, BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockSizeVertical * 15, 
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 5,
        vertical: SizeConfig.blockSizeHorizontal * 2, 
      ),
        scrollDirection: Axis.horizontal,
        itemCount: facilities.length,
        separatorBuilder: (_, __) => SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
        itemBuilder: (context, index) {
          Facility facility = facilities[index];
          return NearByFacilityCard(
            color: _getFacilityColor(facility.facilityCode!),
            icon: facility.facilityIconPath!,
            label: facility.facilityName!,
            onTap: () {
              _handleNavigation(facility, context);
            },
          );
        },
      ),
    );
  }

  // Define a method to map facility codes to colors
  Color _getFacilityColor(String facilityCode) {
  // Define custom colors for specific facility codes
  final colorMap = {
      'SHUTTLE': AppColors.lightPurpleColor,
      'TIMINGS': AppColors.creamColor,
      'PARKING': AppColors.lightBlueColor,
      'PLATFORM': AppColors.lightPinkColor,
      'WIFI': AppColors.lightPurpleColor2,
      'LMC': AppColors.lightPinkColor,
      'BUSSTOP': AppColors.lightBeigeColor1,
      'NEIGHBOURHOOD': AppColors.darkBeigeColor,
      'CATCHMENT': AppColors.lightBeigeColor,
    };

    // Default color if facilityCode is not in the map
    const defaultColor = AppColors.lightBeige;

    // Return the color for the given facilityCode or the default color
    return colorMap[facilityCode] ?? defaultColor;
  }

  Widget _buildVerticalList(List<Facility> facilities, BuildContext context) {
    return ListView.separated(
      itemCount: facilities.length,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 5,
        vertical: SizeConfig.blockSizeHorizontal * 2, 
      ),
      separatorBuilder: (_, __) => SizedBox(height: SizeConfig.blockSizeVertical * 2),
      itemBuilder: (context, index) {
        Facility facility = facilities[index];
        return StationFacilityCard(
          icon: facility.facilityIconPath!,
          label: facility.facilityName!,
          content: facility.facilityContent!,
          // onTap: () {
          //   StationFacilitiesDialog.showCustomDialog(context, facility);
          // },
        );
      },
    );
  }

  bool _isDialogFacility(Facility facility) {
    const dialogCodes = [
      'LIFTS',
      'TOILET',
      'FIRSTAID',
      'WATER',
      'EMERGENCY',
      'ESCALATOR',
      'ATM',
      'EV CHARGING',
      'MMTS',
      'STAIR CASES',
    ];
    return dialogCodes.contains(facility.facilityCode);
  }

  void _handleNavigation(Facility facility, BuildContext context) {
    if (facility.facilityCode == 'SHUTTLE' ||
        facility.facilityCode == 'TIMINGS' ||
        facility.facilityCode == 'PARKING' ||
        facility.facilityCode == 'PLATFORM' ||
        facility.facilityCode == 'WIFI' ||
        facility.facilityCode == 'LMC') {
      Get.toNamed(
        Routes.webViewScreen,
        arguments: {
          'contentUrl': facility.facilityContentUrl,
          'facilityContent': facility.facilityContent,
        },
      );
    } else if (facility.facilityCode == 'BUSSTOP') {
      Get.toNamed(
        Routes.busStopPage,
        arguments: {
          'contentUrl': facility.busstop,
        },
      );
    } else if (facility.facilityCode == 'NEIGHBOURHOOD') {
      Get.toNamed(Routes.neighbourhoodAreasPage);
    } else if (facility.facilityCode == 'CATCHMENT') {
      Get.toNamed(Routes.impCatchmentAreaPage);
    }
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.blockSizeVertical * 1,
        horizontal: SizeConfig.blockSizeHorizontal * 5
      ),
      child: Text(
        title,
        style: AppTextStyle.commonTextStyle10().copyWith(color: AppColors.blackColor),
      ),
    );
  }

}
