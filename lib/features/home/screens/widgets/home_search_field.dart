// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:t_savaari/common/styles/app_style.dart';
// import 'package:t_savaari/utils/constants/color.dart';
// import 'package:t_savaari/utils/constants/image_strings.dart';
// import 'package:t_savaari/utils/constants/size_config.dart';

// class HomeSearchField extends StatefulWidget {
//   const HomeSearchField({super.key});

//   @override
//   State<HomeSearchField> createState() => _HomeSearchFieldState();
// }

// class _HomeSearchFieldState extends State<HomeSearchField> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void dispose() {
//     _searchController.dispose(); 
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);

//     return Expanded(
//       child: Padding(
//         padding: EdgeInsets.only(
//           left: SizeConfig.blockSizeHorizontal * 5,
//           right: SizeConfig.blockSizeHorizontal * 12,
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Container(
//                 height: SizeConfig.blockSizeVertical * 4.5,
//                 margin: const EdgeInsets.symmetric(horizontal: 0),
//                 child: TextField(
//                   controller: _searchController, // Attach the controller
//                   style: AppTextStyle.commonTextStyle3().copyWith(color: AppColors.offWhiteColor),
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     hintText: 'Search',
//                     hintStyle: AppTextStyle.commonTextStyle3().copyWith(color: AppColors.offWhiteColor),
//                     fillColor: AppColors.lightBlueColor1,
//                     filled: true,
//                     enabledBorder: const OutlineInputBorder(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         bottomLeft: Radius.circular(10),
//                         topRight: Radius.zero,
//                         bottomRight: Radius.zero,
//                       ),
//                       borderSide: BorderSide(
//                         color: AppColors.lightBlueColor2,
//                         width: 1,
//                       ),
//                     ),
//                     focusedBorder: const OutlineInputBorder(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         bottomLeft: Radius.circular(10),
//                         topRight: Radius.zero,
//                         bottomRight: Radius.zero,
//                       ),
//                       borderSide: BorderSide(
//                         color: AppColors.lightBlueColor2,
//                         width: 2,
//                       ),
//                     ),
//                     contentPadding: EdgeInsets.only(
//                       left: SizeConfig.blockSizeHorizontal * 4,
//                       top: SizeConfig.blockSizeVertical * 1.5,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 _searchController.clear(); // Clear the text input
//                 FocusScope.of(context).unfocus(); // Close the keyboard
//               },
//               child: Container(
//                 height: SizeConfig.blockSizeVertical * 4.5,
//                 width: SizeConfig.blockSizeVertical * 4.5,
//                 decoration: const BoxDecoration(
//                   color: AppColors.whiteColor,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: SizeConfig.blockSizeHorizontal * 2.4,
//                   ),
//                   child: SvgPicture.asset(
//                     TImages.homeSearchIcon,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
