import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_savaari/features/fare_calculation/models/get_fare_model.dart';
import 'package:t_savaari/utils/http/http_client.dart';

class FareCalculationRepository extends GetxController{
  static FareCalculationRepository get instance => Get.find();

  Future<GetFareModel> getFare(payload) async {
    try {
      final data = await THttpHelper.post(
        'https://122.252.226.254:5101/api',
        'v3/Tickets/GetFare',
        payload,
      );
      return GetFareModel.fromJson(data);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      print( "${e.toString()}");
      throw 'Something went wrong. Please try again later!';
    }
  }
}
