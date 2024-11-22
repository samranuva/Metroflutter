import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({
    super.key,
    required this.image,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final String image;
  final String label;
  final Color color;
  final VoidCallback onTap; 
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return GestureDetector(
      onTap: onTap, 
      child: Column(
        children: [
          Container(
            height: SizeConfig.blockSizeVertical * 7, 
            width: SizeConfig.blockSizeVertical * 7, 
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10), 
            ),
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.5),
            child: SvgPicture.asset(
              image,
              height: SizeConfig.blockSizeVertical * 3, 
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 1.2), 
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyle.commonTextStyle8(),
          ),
        ],
      ),
    );
  }
}
