import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class NearByFacilityCard extends StatelessWidget {
  const NearByFacilityCard({
    super.key,
    required this.icon,
    required this.label,
    this.color,
    required this.onTap,
  });

  final String icon;
  final String label;
  final Color? color;
  final VoidCallback onTap; 
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return GestureDetector(
      onTap: onTap, 
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: SizeConfig.blockSizeVertical * 8, 
            width: SizeConfig.blockSizeVertical * 8, 
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10), 
            ),
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.5),
            child: Image.network(
              icon,
              height: SizeConfig.blockSizeVertical * 3, 
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 1.2), 
          SizedBox(
            width: SizeConfig.blockSizeVertical * 9, // Set width to control wrapping
            child: Text(
              label,
              maxLines: 2, // Allows up to two lines
              overflow: TextOverflow.ellipsis, // Adds ellipsis if text exceeds max lines
              textAlign: TextAlign.center,
              style: AppTextStyle.commonTextStyle7().copyWith(color: AppColors.greyColor),
            ),
          ),
        ],
      ),
    );
  }
}
