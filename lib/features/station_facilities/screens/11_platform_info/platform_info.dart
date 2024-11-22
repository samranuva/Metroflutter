import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/station_facilities/screens/11_platform_info/widgets/platform_info_card.dart';

class PlatformInformationScreen extends StatelessWidget {
  const PlatformInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CommonAppBar(title: "Station Facilities"),
      body: _buildUI(),
    );
  }

  Widget _buildUI(){
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 5,
          vertical: SizeConfig.blockSizeVertical * 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Platform Information',
              style: AppTextStyle.commonTextStyle4().copyWith(color: AppColors.tertiaryColor)
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 3,),
            const PlatformInfoCard(
              title: 'Platform No. 1',
              subTitle: 'Towards Hitec City',
            ),

            SizedBox(height: SizeConfig.blockSizeVertical * 3),

            const PlatformInfoCard(
              title: 'Platform No. 2',
              subTitle: 'Towards Nagole',
            ),
          ],
        ),
      ),
    );
  }


}


  
