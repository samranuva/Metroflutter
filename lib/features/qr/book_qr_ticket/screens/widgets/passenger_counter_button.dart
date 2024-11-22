import 'package:flutter/material.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class PassengerCounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const PassengerCounterButton({
    super.key,
    required this.icon, 
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 7,
        height: SizeConfig.blockSizeHorizontal * 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Icon(icon, size: SizeConfig.blockSizeHorizontal * 5, color: Colors.black),
        ),
      ),
    );
  }
}