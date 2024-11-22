import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_savaari/common/components/circular_container.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/features/my_orders/screens/cancelled_order_details/widgets/location_point_widget.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

import '../../my_orders/widgets/share_ticket_button.dart';

class JourneyDetailsCard extends StatelessWidget {
  const JourneyDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildJourneyDetailsCard() ;
  }

  Widget _buildJourneyDetailsCard() {
    return CircularContainer(
      child: Column(
        children: [
          _buildJourneyPoints(),
          SizedBox(height: SizeConfig.blockSizeVertical * 2),
          _buildQRCodeSection(),
          SizedBox(height: SizeConfig.blockSizeVertical * 1),
          _buildStatusAndTime(),
        ],
      ),
    );
  }

  Widget _buildJourneyPoints() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LocationPoint(title: 'Starting from', location: 'Nagole', isStart: true),
        Icon(Icons.arrow_forward, size: SizeConfig.blockSizeHorizontal * 5),
        SizedBox(width: SizeConfig.blockSizeHorizontal * 5),
        LocationPoint(title: 'Going to', location: 'Narayanaguda', isStart: false),
      ],
    );
  }

  Widget _buildQRCodeSection() {
    return SvgPicture.asset(
      TImages.imgOnGoingStatusQr,
      height: SizeConfig.blockSizeHorizontal * 50,
      fit: BoxFit.fitHeight,
    );
  }
  
  Widget _buildStatusAndTime() {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Expires', style: AppTextStyle.commonTextStyle3().copyWith(color: AppColors.lightGreenColor1)),
              SizedBox(height: SizeConfig.blockSizeVertical * 0.5),
              Text('Sep 9th, 7:00 PM', style: AppTextStyle.commonTextStyle3().copyWith(color: AppColors.greyColor)),
            ],
          ),

          ShareTicketButton(
            onPressed: (){},
          ),
          
        ],
      ),
    );
  }

}