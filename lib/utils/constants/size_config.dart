import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late bool isPortrait;
  static late bool isMobilePortrait;

  static void init(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    isPortrait = _mediaQueryData.orientation == Orientation.portrait;
    isMobilePortrait = isPortrait && screenWidth < 600;
  }
}


// Container(
//   width: SizeConfig.blockSizeHorizontal * 80, // 80% of screen width
//   height: SizeConfig.blockSizeVertical * 20,  // 20% of screen height
//   color: Colors.green,
//   child: const Center(
//     child: Text(
//       'Another Responsive Container',
//       style: TextStyle(color: Colors.white),
//     ),
//   ),
// );



// Text(
//   'Responsive Text',
//   style: TextStyle(
//     fontSize: SizeConfig.blockSizeHorizontal * 5,  // 5% of screen width
//   ),
// ),



// Padding(
//   padding: EdgeInsets.symmetric(
//     horizontal: SizeConfig.blockSizeHorizontal * 5, // 5% of screen width
//     vertical: SizeConfig.blockSizeVertical * 2,     // 2% of screen height
//   ),
//   child: Text('Responsive Padding'),
// ),
