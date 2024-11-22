import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_savaari/data/repositories/fare_calculation/fare_calculation_api_repository.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/controllers/station_list_controller.dart';
import 'package:t_savaari/features/fare_calculation/models/get_fare_model.dart';
import 'package:t_savaari/utils/helpers/helper_functions.dart';
import 'package:t_savaari/utils/popups/loaders.dart';

class FareCalculationController extends GetxController {
  static FareCalculationController get instance => Get.find();

  
  //variables
  final isLoading = false.obs;
  Rxn<String> source = Rxn<String>();
  Rxn<String> destination = Rxn<String>();
  // final source = ''.obs;
  // final destination = ''.obs;
  final deviceStorage = GetStorage();
  final fareCalculationRepository = Get.put(FareCalculationRepository());
  final stationController = Get.put(StationListController());
  final fareData = <GetFareModel>{}.obs;

  Future<void> getFare() async {
    try {
      final token = await deviceStorage.read('access_token');

      final fromStation = source.value != ''
          ? stationController.stationList
              .firstWhere((station) => station.name == source.value)
          : null;
      final fromStationId = fromStation?.stationId;

      final toStation = destination.value != ''
          ? stationController.stationList
              .firstWhere((station) => station.name == destination.value)
          : null;
      final toStationId = toStation?.stationId;

      if (token == null || fromStationId == null || toStationId == null) {
        return;
      }

      //Show loader while loading categories
      isLoading.value = true;
      final payload =  {
        "authorization": "$token",
        "fromStationId": fromStationId,
        "toStationId": toStationId,
        "zoneNumberOrStored_ValueAmount": 0,
        "ticketTypeId": 20,
        "merchant_id": "5000886103344",
        "travelDatetime": "20241108155952"
      };
      

      final data = await fareCalculationRepository.getFare(payload);
      if (fareData.isNotEmpty) {
        fareData.clear();
      }
      fareData.add(data);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  

  // Check if selected stations are valid
  bool areStationsValid() {
    if (source.value != null && destination.value != null) {
      if (source.value != destination.value) {
        return true;  // Stations are valid
      } else {
        // Show the snackbar after the current frame is built
        WidgetsBinding.instance.addPostFrameCallback((_) {
          THelperFunctions.showSnackBar('Source and Destination stations cannot be the same!');
        });
        return false;  // Stations are invalid
      }
    }
    return false;  // If either station is null
  }

  void resetFields() {
    source.value = null;
    destination.value = null;
  }
}
