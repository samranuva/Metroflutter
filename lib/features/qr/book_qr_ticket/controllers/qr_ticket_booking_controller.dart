import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_savaari/data/repositories/book_qr/book_qr_repository.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/controllers/station_list_controller.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/models/qr_get_fare_model.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/merchant_id.dart';
import 'package:t_savaari/utils/helpers/helper_functions.dart';
import 'package:t_savaari/utils/helpers/network_manager.dart';
import 'package:t_savaari/utils/popups/full_screen_loader.dart';
import 'package:t_savaari/utils/popups/loaders.dart';

class QRTicketBookingController extends GetxController {
  static QRTicketBookingController get instance => Get.find();
  
  //variables
  final isLoading = false.obs;
  final passengerCount = 1.obs;
  final ticketType = false.obs; // false: Single Trip, true: Round Trip
  final source = ''.obs;
  final destination = ''.obs;
  final deviceStorage = GetStorage();
  final bookQrRepository = Get.put(BookQrRepository());
  final stationController = Get.put(StationListController());
  final qrFareData = <QrGetFareModel>{}.obs;

  // Blinking Icon Visibility
  final isVisibleFrom = true.obs;
  final isVisibleTo = true.obs;

  // Timer for blinking
  Timer? _blinkingTimer;

  // Constructor
  QRTicketBookingController() {
    _startBlinkingIfNeeded();
    //_setInitialValues();
  }

  // // Initial Values for Resetting
  // late final int _initialPassengerCount;
  // late final bool _initialIsSingleTrip;
  // late final String? _initialFromStation;
  // late final String? _initialToStation;

  // void _setInitialValues() {
  //   _initialPassengerCount = passengerCount.value;
  //   _initialIsSingleTrip = ticketType.value;
  //   _initialFromStation = source.value;
  //   _initialToStation = destination.value;
  // }

  // Reset Fields to Initial Values
  // void resetFields() {
  //   passengerCount.value = _initialPassengerCount;
  //   ticketType.value = _initialIsSingleTrip;
  //   source.value = _initialFromStation!;
  //   destination.value = _initialToStation!;
  //   _startBlinkingIfNeeded();
  // }


  Future<void> getFare() async {
    try {
      final token = await deviceStorage.read('access_token');

      //if (!validateStations()) return;

      final ticketTypeId = ticketType.value ? '20' : '10';

      final fromStation = source.value != ''   ///why we are doing extra steps, we can directly pass the source value ?
          ? THelperFunctions.getStationFromStationName(
              source.value, stationController.stationList)
          : null;

      final fromStationId = fromStation?.stationId;

      final toStation = destination.value != ''  ///why we are doing extra steps, we can directly pass the destination value ?
          ? THelperFunctions.getStationFromStationName(
              destination.value, stationController.stationList)
          : null;
      final toStationId = toStation?.stationId;

      if (token == null || fromStationId == null || toStationId == null) {
        return;
      }

      if (fromStationId == toStationId) {
        TLoaders.errorSnackBar(
            title: 'Oh Snap!',
            message: 'Origin and Desitnation station should be diffrent');
        return;
      }

      //Show loader while loading categories
      isLoading.value = true;
      final payload = {
        "token": "$token",
        "fromStationId": fromStationId,
        "merchant_id": MerchantDetails.merchantId,
        "ticketTypeId": ticketTypeId, //SJT = 10 RJT=20
        "toStationId": toStationId,
        "travelDatetime": "${DateTime.now()}",
        "zoneNumberOrStored_ValueAmount": 0 //STATIC VALUE
      };
      final fareData = await bookQrRepository.fetchFare(payload);
      if (qrFareData.isNotEmpty) {
        qrFareData.clear();  //What is the use ?
      }
      // print(payload);
      qrFareData.add(fareData);

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove loader
      isLoading.value = false;
    }
  }

  // Future<void> generateTicket() async {
  //   try {
  //     TFullScreenLoader.openLoadingDialog(
  //         'Processing your request', TImages.docerAnimation);

  //     //Check Internet Connectivity
  //     final isConnected = await NetworkManager.instance.isConnected();
  //     if (!isConnected) {
  //       //Stop Loading
  //       TFullScreenLoader.stopLoading();
  //       TLoaders.customToast(message: 'No Internet Connection');
  //       return;
  //     }

  //     final payload = {
  //       "customer_details": {
  //         "customer_id": "CUSTID123",
  //         "customer_email": "abc@gmail.com",
  //         "customer_phone": "9999999999",
  //         "customer_name": "abcds"
  //       },
  //       "order_meta": {
  //         "return_url": "https://www.cashfree.com/devstudio/thankyou",
  //         "notify_url":
  //             "https://122.252.226.254:5114/api/v1/NotifyUrl/CFPaymentRequest"
  //       },
  //       "order_id": "test_tsavaari_${DateTime.now().millisecondsSinceEpoch}",
  //       "order_amount": (passengerCount.value * qrFareData.first.finalFare!),
  //       "order_currency": "INR",
  //       "order_note": "some order note here"
  //     };

  //     final createOrderData =
  //         await bookQrRepository.createQrPaymentOrder(payload);

  //     final session = CFSessionBuilder()
  //         .setEnvironment(CFEnvironment.SANDBOX)
  //         .setOrderId(createOrderData.orderId!)
  //         .setPaymentSessionId(createOrderData.paymentSessionId!)
  //         .build();
  //     final cfWebCheckout =
  //         CFWebCheckoutPaymentBuilder().setSession(session).build();
  //     final cfPaymentGateWay = CFPaymentGatewayService();
  //     cfPaymentGateWay.setCallback((orderId) async {
  //       try {
  //         final verifyPayment = await bookQrRepository.verifyPayment(orderId);
  //         print(
  //             '----------------------------------------------------------------');
  //         print(verifyPayment.orderStatus);
  //         if (verifyPayment.orderStatus == 'PAID') {
  //           final token = await deviceStorage.read('token');
  //           final ticketTypeId = ticketType.value ? '20' : '10';

  //           final fromStation = source.value != ''
  //               ? stationController.stationList
  //                   .firstWhere((station) => station.name == source.value)
  //               : null;

  //           final fromStationId = fromStation?.stationId;

  //           final toStation = destination.value != ''
  //               ? stationController.stationList
  //                   .firstWhere((station) => station.name == destination.value)
  //               : null;
  //           final toStationId = toStation?.stationId;

  //           final requestPayload = {
  //             "token": "$token",
  //             "merchantOrderId": verifyPayment.orderId,
  //             "merchantId": MerchantDetails.merchantId,
  //             "transType": "0",
  //             "fromStationId": fromStationId,
  //             "toStationid": toStationId,
  //             "ticketTypeId": ticketTypeId,
  //             "noOfTickets": passengerCount.value,
  //             "travelDateTime": "${DateTime.now()}",
  //             "merchantEachTicketFareBeforeGst": 0,
  //             "merchantEachTicketFareAfterGst": 0,
  //             "merchantTotalFareBeforeGst": 0,
  //             "merchantTotalCgst": 0,
  //             "merchantTotalSgst": 0,
  //             "merchantTotalFareAfterGst": 0,
  //             "ltmrhlPassId": "",
  //             "patronPhoneNumber": "9999999999",
  //             "fareQuoteIdforOneTicket":
  //                 "${qrFareData.first.fareQuotIdforOneTicket}",
  //           };

  //           final ticketData =
  //               await bookQrRepository.generateTicket(requestPayload);

  //           //Stop Loading
  //           TFullScreenLoader.stopLoading();

  //           //Navigate to Dispaly QR Page
  //           if (ticketData.returnCode == '0' &&
  //               ticketData.returnMsg == 'SUCESS') {
  //             Get.offAll(() => DisplayQrScreen(
  //                   qrTicketData: ticketData,
  //                   stationList: stationController.stationList,
  //                 ));
  //           } else {
  //             throw 'Something went wrong. Please try again later!';
  //           }
  //         }
  //       } catch (e) {
  //         TFullScreenLoader.stopLoading();
  //         TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  //       }
  //     }, (p0, orderId) {
  //       //Stop Loading
  //       TFullScreenLoader.stopLoading();
  //       TLoaders.errorSnackBar(
  //           title: 'Oh Snap!', message: p0.getMessage().toString());
  //     });
  //     cfPaymentGateWay.doPayment(cfWebCheckout);
  //   } on CFException catch (e) {
  //     //Stop Loading
  //     TFullScreenLoader.stopLoading();
  //     TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  //   } catch (e) {
  //     //Stop Loading
  //     TFullScreenLoader.stopLoading();
  //     TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  //   }
  // }


  // Update Passenger Count
  void updatePassengerCount(int newCount) {
    if (newCount >= 1 && newCount <= 6) {
      passengerCount.value = newCount;
    } else if (newCount > 6) {
      THelperFunctions.showSnackBar('Maximum of 6 passengers allowed');
    }
  }

  // Select Trip Type
  void selectTripType(bool isRoundTrip) {
    ticketType.value = isRoundTrip;
  }

  // Set Starting Station
  void setFromStation(String station) {
    source.value = station;
    _startBlinkingIfNeeded();
  }

  // Set Destination Station
  void setToStation(String station) {
    destination.value = station;
    _startBlinkingIfNeeded();
  }


  // Validate Station Selection
  bool validateStations() {
    if (source.value.isEmpty) {
      THelperFunctions.showSnackBar('Please select a starting station.');
      return false;
    }
    if (destination.value.isEmpty) {
      THelperFunctions.showSnackBar('Please select a destination station.');
      return false;
    }
    if (source.value == destination.value) {
      THelperFunctions.showSnackBar('Source and destination stations cannot be the same!');
      return false;
    }
    return true;
  }






  /// Blinking Icons Logic..................................
  bool get shouldBlinkFrom => source.value == null || source.value.isEmpty;
  bool get shouldBlinkTo => destination.value == null || destination.value.isEmpty;

  void _startBlinkingIfNeeded() {
    _blinkingTimer?.cancel();
    if (shouldBlinkFrom || shouldBlinkTo) {
      _blinkingTimer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
        isVisibleFrom.value = shouldBlinkFrom ? !isVisibleFrom.value : true;
        isVisibleTo.value = shouldBlinkTo ? !isVisibleTo.value : true;
      });
    } else {
      isVisibleFrom.value = true;
      isVisibleTo.value = true;
    }
  }

  // Cleanup Timer on Close
  @override
  void onClose() {
    _blinkingTimer?.cancel();
    super.onClose();
  }
}
