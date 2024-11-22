import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_savaari/features/station_facilities/models/station_facilities_model.dart';
import 'package:t_savaari/features/station_facilities/models/station_facilities_services_model.dart';
import 'package:t_savaari/utils/constants/api_constants.dart';
import 'package:t_savaari/utils/http/http_client.dart';


class StationFacilitiesRepository extends GetxController {
  
  Future<StationFacilitiesModel> fetchStationsWithCoordsList() async {
    try {
      final data = await THttpHelper.get(
        'https://s3.ap-south-1.amazonaws.com/files.tsavaari.com',
        ApiEndPoint.getStationsWithCoords,
      );
      return StationFacilitiesModel.fromJson(data);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      print(e.toString());
      throw 'Something went wrong. Please try again later!';
    }
  }


  Future<MetroStationFacilitiesServicesModel> fetchMetroStationFacilitiesServices({required int stnId}) async {
    try {
      final data = await THttpHelper.get(
        'https://app.tsavaari.com/LTProject',
        '${ApiEndPoint.getStationFacilitiesServices}$stnId',
      );
      return MetroStationFacilitiesServicesModel.fromJson(data);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      print(e.toString());
      throw 'Something went wrong. Please try again later!';
    }
  }
}
