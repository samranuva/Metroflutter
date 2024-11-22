import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_savaari/utils/http/http_client.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/models/station_list_model.dart';


class StationListRepository extends GetxController {
  Future<StationDataModel> fetchStationList(String token) async {
    try {
      final data = await THttpHelper.post(
        'https://devapp.tsavaari.com/LTProject',
        'getstationsqr/services.do',
        {"authorization": token},
      );
      return StationDataModel.fromJson(data);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      throw 'Something went wrong. Please try again later!';
    }
  }
}
