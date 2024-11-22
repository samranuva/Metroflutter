import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class CloseBackButton extends StatelessWidget {
  const CloseBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Align(
        alignment: Alignment.topLeft,
        child: SvgPicture.asset(
          TImages.borderedCloseIcon,
          height: SizeConfig.blockSizeHorizontal * 7,
        ),
      ),
    );
  }
}