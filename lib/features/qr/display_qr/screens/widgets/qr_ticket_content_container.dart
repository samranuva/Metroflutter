// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:t_savaari/common/widgets/containers/t_circular_container.dart';
// import 'package:t_savaari/features/qr/display_qr/controllers/display_qr_controller.dart';
// import 'package:t_savaari/features/qr/display_qr/models/qr_code_model.dart';
// import 'package:t_savaari/features/qr/display_qr/screens/widgets/carbon_emission_message.dart';
// import 'package:t_savaari/features/qr/display_qr/screens/widgets/passenger_count.dart';
// import 'package:t_savaari/features/qr/display_qr/screens/widgets/ticket_expiry.dart';
// import 'package:t_savaari/features/qr/display_qr/screens/widgets/ticket_status.dart';
// import 'package:t_savaari/utils/constants/colors.dart';
// import 'package:t_savaari/utils/constants/sizes.dart';
// import 'package:t_savaari/utils/helpers/helper_functions.dart';

// class QrTicketContentContainer extends StatelessWidget {
//   const QrTicketContentContainer({
//     super.key,
//     required this.qrData,
//   });
//   final QrTicketModel qrData;

//   @override
//   Widget build(BuildContext context) {
//     final displayQrController = DisplayQrController.instance;
//     final isSjtSinglePassenger = qrData.tickets![0].ticketTypeId == 10
//         ? qrData.tickets!.length == 1
//             ? true
//             : false
//         : false;

//     final isRjtSinglePassenger = qrData.tickets![0].ticketTypeId == 20
//         ? qrData.tickets!.length == 1
//             ? true
//             : false
//         : false;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             //-- Ticket Count

//             Obx(
//               () => PassengerCount(
//                 totalTicketCount: qrData.tickets!.length,
//                 currentValue:
//                     displayQrController.carouselCurrentIndex.value + 1,
//               ),
//             ),

//             //--Ticket Statu
//             Obx(
//               () => TicketStatus(
//                 ticketStatus: qrData
//                     .tickets![displayQrController.carouselCurrentIndex.value]
//                     .ticketStatus!,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: TSizes.spaceBtwItems,
//         ),

//         //-- QR Image
//         CarouselSlider(
//           options: CarouselOptions(
//             autoPlay: false,
//             initialPage: displayQrController.carouselCurrentIndex.value,
//             enableInfiniteScroll:
//                 (!isSjtSinglePassenger && !isRjtSinglePassenger),
//             viewportFraction: 1,
//             onPageChanged: (index, reason) {
//               displayQrController.updatePageIndicator(
//                   index, qrData.tickets!.length);
//             },
//           ),
//           items: qrData.tickets!
//               .map(
//                 (ticket) => QrImageView(
//                   data: ticket.ticketContent!,
//                   version: QrVersions.auto,
//                 ),
//               )
//               .toList(),
//         ),

//         const SizedBox(
//           height: TSizes.spaceBtwItems / 2,
//         ),

//         //-- Carousel dots
//         if (!isSjtSinglePassenger && !isRjtSinglePassenger)
//           Obx(
//             () => Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (int i = 0; i < qrData.tickets!.length; i++)
//                   TCircularContainer(
//                     width: 10,
//                     height: 10,
//                     backgroundColor:
//                         displayQrController.carouselCurrentIndex.value == i
//                             ? TColors.primary
//                             : TColors.grey,
//                     margin: const EdgeInsets.only(right: TSizes.sm),
//                   ),
//               ],
//             ),
//           ),
//         const SizedBox(
//           height: TSizes.spaceBtwItems,
//         ),

//         //--Ticket id
//         Obx(
//           () => Text(
//             'TKID ${qrData.tickets![displayQrController.carouselCurrentIndex.value].ticketId!}',
//             softWrap: true,
//             style: Theme.of(context)
//                 .textTheme
//                 .labelSmall!
//                 .copyWith(color: TColors.black),
//           ),
//         ),
//         const SizedBox(
//           height: TSizes.spaceBtwItems / 2,
//         ),
//         //Ticket Expiry
//         TicketExpiry(
//           dateTime: THelperFunctions.getFormattedDateTimeString(
//               qrData.tickets![0].ticketExpiryTime!),
//         ),

//         if (!isSjtSinglePassenger && !isRjtSinglePassenger)
//           const SizedBox(
//             height: TSizes.spaceBtwItems,
//           ),
//         const Divider(),

//         //--Carbon emission message
//         CarbonEmissionMessage(message: qrData.tickets![0].carbonEmissionMsg!),
//       ],
//     );
//   }
// }
