// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:t_savaari/common/styles/app_style.dart';
// import 'package:t_savaari/utils/constants/color.dart';
// import 'package:t_savaari/utils/constants/size_config.dart';
// import 'package:t_savaari/utils/constants/image_strings.dart';
// import 'package:t_savaari/routes/routes.dart';
// import 'package:t_savaari/features/media/media.dart'; // Import the routes file

// class SideDrawer extends StatelessWidget {
//   const SideDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);
//     final deviceStorage = GetStorage();


//     return Drawer(
//       backgroundColor: AppColors.tertiaryColor,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           _buildDrawerHeader(context),

//           _buildDrawerItem(
//             icon: TImages.drawerHome,
//             text: 'Home',
//             onTap: () => Get.toNamed(Routes.homePage),
//           ),
//           _buildDrawerItem(
//             icon: TImages.drawerQR,
//             text: 'Book QR Ticket',
//             onTap: () => Get.toNamed(Routes.qrTicketBookingPage),
//           ),
//           _buildDrawerItem(
//             icon: TImages.drawerCovid,
//             text: 'Covid Do\'s & Dont\'s',
//             onTap: () => Get.toNamed(Routes.dOsAndDONTsPage),
//           ),
//           _buildDrawerItem(
//             icon: TImages.drawerHistory,
//             text: 'Travel History QR/Card',
//             onTap: () => Get.toNamed(Routes.travelHistoryPage),
//           ),
//           _buildDrawerItem(
//             icon: TImages.drawerCalc,
//             text: 'Fare Calculation',
//             onTap: () => Get.toNamed(Routes.metroFareCalculationPage),
//           ),
//           _buildDrawerItem(
//             icon: TImages.drawerStation,
//             text: 'Station Facilities',
//             onTap: () => Get.toNamed(Routes.stationFacilitiesPage),
//           ),
//           _buildDrawerItem(
//             icon: TImages.drawerBalance,
//             text: 'View Balance /Recharge',
//             onTap: () => Get.toNamed(Routes.viewBalanceOrRechargePage),
//           ),
//           _buildDrawerItem(
//             icon: TImages.drawerOrders,
//             text: 'My Order',
//             onTap: () => Get.toNamed(Routes.myOrdersPage),
//           ),
//           _buildDrawerItem(
//             icon: TImages.drawerMedia,
//             text: 'Media',
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => const MediaAlertBox(),
//               );
//             },
//           ),
//           _buildDrawerItem(
//             icon: TImages.drawerMap,
//             text: 'Metro Network Map',
//             onTap: () => Get.toNamed(Routes.metroNetworkMapPage),
//           ),
//           _buildDrawerItem(
//             icon: TImages.drawerOffers,
//             text: 'Offers',
//             onTap: () => Get.toNamed(Routes.offersPage),
//           ),
//           _buildDrawerItem(
//             icon: TImages.drawerFeedback,
//             text: 'Feedback',
//             onTap: () => Get.toNamed(Routes.feedbackPage),
//           ),
//           _buildDrawerItem(
//             icon: TImages.drawerTerms,
//             text: 'Terms of Service',
//           ),
//           _buildDrawerItem(
//             icon: TImages.drawerLogout,
//             text: 'Logout',
//             onTap: () async {
//               await deviceStorage.remove('access_token');
//               await deviceStorage.remove('refresh_token');
//               Get.offAllNamed(Routes.loginPage);
//             }
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDrawerHeader(BuildContext context) {
//     return Stack(
//       children: [
//         SizedBox(
//           height: SizeConfig.blockSizeHorizontal * 36,
//           child: DrawerHeader(
//             decoration: const BoxDecoration(
//               color: AppColors.tertiaryColor,
//             ),
//             child: GestureDetector(
//               onTap: () => Get.toNamed(Routes.profilePage),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SvgPicture.asset(
//                     TImages.drawerProfile,
//                     height: SizeConfig.blockSizeHorizontal * 10,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       left: SizeConfig.blockSizeHorizontal * 4,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Row(
//                           children: [
//                             Text('David', style: AppTextStyle.commonTextStyle9()),
//                             SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
//                             GestureDetector(
//                               onTap: () => Get.toNamed(Routes.profilePage),
//                               child: SvgPicture.asset(
//                                 TImages.drawerEdit,
//                                 height: SizeConfig.blockSizeHorizontal * 5,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Text('9876543210', style: AppTextStyle.commonTextStyle10()),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: SizeConfig.blockSizeVertical * 5,
//           right: SizeConfig.blockSizeHorizontal * 2.5,
//           child: GestureDetector(
//             onTap: () => Get.back(),
//             child: SvgPicture.asset(
//               TImages.drawerClose,
//               height: SizeConfig.blockSizeHorizontal * 3.5,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDrawerItem({required String icon, required String text, void Function()? onTap}) {
//     return ListTile(
//       dense: true,
//       leading: SvgPicture.asset(
//         icon,
//         height: SizeConfig.blockSizeHorizontal * 5,
//       ),
//       title: Text(
//         text,
//         style: AppTextStyle.commonTextStyle2().copyWith(color: AppColors.whiteColor),
//       ),
//       onTap: onTap,
//     );
//   }



// }
