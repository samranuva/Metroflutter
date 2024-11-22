// import 'package:flutter/material.dart';
// import 'package:t_savaari/features/qr/book_qr_ticket/models/station_list_model.dart';
// import 'package:t_savaari/features/qr/display_qr/models/qr_code_model.dart';
// import 'package:t_savaari/utils/constants/colors.dart';
// import 'package:t_savaari/utils/constants/sizes.dart';
// import 'package:t_savaari/utils/helpers/helper_functions.dart';

// class QrTicketCard extends StatelessWidget {
//   const QrTicketCard({
//     super.key,
//     required this.qrData,
//     required this.stationList,
//   });
//   final QrTicketModel qrData;
//   final List<StationListModel> stationList;

//   @override
//   Widget build(BuildContext context) {
//     final isDark = THelperFunctions.isDarkMode(context);

//     return Column(
//       children: [
//         PhysicalModel(
//           color: isDark
//               ? TColors.dark.withOpacity(.5)
//               : TColors.grey.withOpacity(.01),
//           shape: BoxShape.rectangle,
//           elevation: isDark ? TSizes.sm : TSizes.lg,
//           shadowColor: isDark ? TColors.white : TColors.grey,
//           borderRadius: BorderRadius.circular(TSizes.md),
//           child: TTicketShapeWidget(
//             child: Container(
//               decoration: BoxDecoration(
//                   color: TColors.white,
//                   borderRadius: BorderRadius.circular(TSizes.md)),
//               padding: const EdgeInsets.all(
//                 TSizes.defaultSpace,
//               ),
//               child: Column(
//                 children: [
//                   QrTicketContentContainer(
//                     qrData: qrData,
//                   ),
//                   const SizedBox(
//                     height: TSizes.spaceBtwSections,
//                   ),
//                   //-- Route and platform info container

//                   DisplayrouteContainer(
//                       qrData: qrData, stationList: stationList),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
