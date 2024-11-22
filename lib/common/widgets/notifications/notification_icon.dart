import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_savaari/utils/constants/colors.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
  });
  final VoidCallback onPressed;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.notification,
            color: TColors.white,
            size: SizeConfig.blockSizeHorizontal * 7,
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Container(
            width: SizeConfig.blockSizeHorizontal * 4.8,
            height: SizeConfig.blockSizeHorizontal * 4.8,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '8',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.white, fontSizeFactor: .8),
              ),
            ),
          ),
        )
      ],
    );
  }
}
