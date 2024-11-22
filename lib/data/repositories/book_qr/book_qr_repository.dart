import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/models/create_order_model.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/models/qr_get_fare_model.dart';
import 'package:t_savaari/features/qr/display_qr/models/qr_code_model.dart';
import 'package:t_savaari/utils/constants/api_constants.dart';
import 'package:t_savaari/utils/http/http_client.dart';


class BookQrRepository extends GetxController {
  static BookQrRepository get instance => Get.find();
  
  Future<QrGetFareModel> fetchFare(payload) async {
    try {
      final data = await THttpHelper.post(
        'https://stage.tsavaari.com',
        ApiEndPoint.getFare,
        payload,
      );

      return QrGetFareModel.fromJson(data);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      throw 'Something went wrong. Please try again later!';
    }
  }

  Future<CreateOrderModel> createQrPaymentOrder(payload) async {
    try {
      final data = await THttpHelper.post(
        'https://stage.tsavaari.com',
        ApiEndPoint.createQrPaymentOrder,
        payload,
      );
      return CreateOrderModel.fromJson(data);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      throw 'Something went wrong. Please try again later!';
    }
  }

  Future<CreateOrderModel> verifyPayment(orderId) async {
    try {
      final data = await THttpHelper.get(
        'https://stage.tsavaari.com',
        '${ApiEndPoint.verifyPayment}/$orderId',
      );
      return CreateOrderModel.fromJson(data);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      throw 'Something went wrong. Please try again later!';
    }
  }

  Future<QrTicketModel> generateTicket(payload) async {
    try {
      final data = await THttpHelper.post(
        'https://stage.tsavaari.com',
        ApiEndPoint.generateTicket,
        payload,
      );
      return QrTicketModel.fromJson(data);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code).message!;
    } catch (e) {
      throw 'Something went wrong. Please try again later!';
    }
  }
}
