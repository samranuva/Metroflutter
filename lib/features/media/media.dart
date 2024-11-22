import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class MediaAlertBox extends StatelessWidget {
  const MediaAlertBox({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), 
      ),
      contentPadding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(TImages.fbIcon,),
              _buildSocialIcon(TImages.twitterIcon,),
              _buildSocialIcon(TImages.youtubeIcon,),
              _buildSocialIcon(TImages.googleIcon),
              _buildSocialIcon(TImages.linkedinIcon,),
              _buildSocialIcon(TImages.wifiIcon),
              _buildSocialIcon(TImages.instaIcon),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(String icon) {
    return Padding(
      padding: EdgeInsets.all( SizeConfig.blockSizeHorizontal * 1),
      child: SvgPicture.asset(
        icon, 
        height: SizeConfig.blockSizeHorizontal * 8),
    );
  }
}
