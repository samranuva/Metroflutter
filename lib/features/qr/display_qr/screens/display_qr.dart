// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:t_savaari/bottom_navigation/bottom_navigation_menu.dart';
// import 'package:t_savaari/common/widgets/appbar/t_appbar.dart';
// import 'package:t_savaari/features/qr/book_qr_ticket/models/station_list_model.dart';
// import 'package:t_savaari/features/qr/display_qr/controllers/display_qr_controller.dart';
// import 'package:t_savaari/features/qr/display_qr/models/qr_code_model.dart';
// import 'package:t_savaari/features/qr/display_qr/screens/widgets/qr_tab_container.dart';
// import 'package:t_savaari/features/qr/display_qr/screens/widgets/qr_ticket_card.dart';
// import 'package:t_savaari/utils/constants/sizes.dart';

// class DisplayQrScreen extends StatelessWidget {
//   const DisplayQrScreen(
//       {super.key, required this.qrTicketData, required this.stationList});
//   final QrTicketModel qrTicketData;
//   final List<StationListModel> stationList;

//   @override
//   Widget build(BuildContext context) {
//     Get.put(DisplayQrController());

//     QrTicketModel getFormatttedTicketData(String indicator) {
//       QrTicketModel ticketData =
//           QrTicketModel.fromJson(jsonDecode(jsonEncode(qrTicketData)));
//       if (qrTicketData.tickets![0].ticketTypeId == 20 &&
//           indicator == 'oneWay') {
//         ticketData.tickets = [];
//         for (var i = 0; i < qrTicketData.tickets!.length; i++) {
//           ticketData.tickets!.addIf(i.isEven, qrTicketData.tickets![i]);
//         }
//       } else if (qrTicketData.tickets![0].ticketTypeId == 20 &&
//           indicator == 'roundTrip') {
//         ticketData.tickets = [];
//         for (var i = 0; i < qrTicketData.tickets!.length; i++) {
//           ticketData.tickets!.addIf(i.isOdd, qrTicketData.tickets![i]);
//         }
//       }
//       return ticketData;
//     }

//     return Scaffold(
//       appBar: TAppBar(
//         showBackArrow: false,
//         title: const Text('Your Tickets'),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Get.offAll(() => const BottomNavigationMenu());
//               },
//               icon: const Icon(
//                 Iconsax.close_circle,
//                 size: TSizes.iconLg,
//               ))
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),
//           child: Center(
//             child: Column(
//               children: [
//                 //-- Qr Ticket Card
//                 if (qrTicketData.tickets![0].ticketTypeId == 20)
//                   QrTabContainer(
//                     stationList: stationList,
//                     tabChildren: const [
//                       Tab(
//                         text: 'Inward',
//                       ),
//                       Tab(
//                         text: 'Retrun',
//                       ),
//                     ],
//                     onWayData: getFormatttedTicketData('oneWay'),
//                     roundTripData: getFormatttedTicketData('roundTrip'),
//                   ),
//                 if (qrTicketData.tickets![0].ticketTypeId == 10)
//                   QrTicketCard(qrData: qrTicketData, stationList: stationList),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
