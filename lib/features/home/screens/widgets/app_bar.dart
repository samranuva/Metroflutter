// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:t_savaari/utils/constants/color.dart';
// import 'package:t_savaari/utils/constants/size_config.dart';
// import 'package:t_savaari/routes/routes.dart';
// import 'package:t_savaari/features/home/screens/widgets/home_search_field.dart';

// class HomeTopBar extends StatelessWidget {
//   const HomeTopBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);

//     return Container(
//       margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5), // Adjust the spacing above top bar
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: SizeConfig.blockSizeHorizontal * 3.5, 
//           vertical: SizeConfig.blockSizeHorizontal * 1.5, 
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Scaffold.of(context).openDrawer(); 
//               },
//               child: Icon(
//                 Icons.menu_rounded, 
//                 color: AppColors.whiteColor,
//                 size: SizeConfig.blockSizeHorizontal * 7.5,
//               ),
//             ),
//             const HomeSearchField(),
            
//             _notificationIcon(context, 15) 
//           ],
//         ),
//       ),
//     );
//   }


//   Widget _notificationIcon(BuildContext context, int notificationCount) {
//     return GestureDetector(
//       onTap: () => Get.toNamed(Routes.notificationsPage),
//       child: Stack(
//         children: [
//           Icon(
//             Icons.notifications_none,
//             color: AppColors.whiteColor,
//             size: SizeConfig.blockSizeHorizontal * 7.5,
//           ),
//           if (notificationCount > 0) // Only show the badge if count is greater than 0
//             Positioned(
//               bottom: SizeConfig.blockSizeVertical * 0.8,
//               right: 0,
//               child: Container(
//                 padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 0.6,), // Adjust padding for circular badge size
//                 decoration: const BoxDecoration(
//                   color: AppColors.redColor,
//                   shape: BoxShape.circle, // Use BoxShape.circle for a perfect circle
//                 ),
//                 constraints: BoxConstraints(
//                   minWidth: SizeConfig.blockSizeHorizontal * 4, // Minimum width for the badge
//                   minHeight: SizeConfig.blockSizeVertical * 3, // Minimum height for the badge
//                 ),
//                 child: Center(
//                   child: Text(
//                     notificationCount > 9 ? '9+' : notificationCount.toString(),
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: SizeConfig.blockSizeHorizontal * 2.5,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
  
// }