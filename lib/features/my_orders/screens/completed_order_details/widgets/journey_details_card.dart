import 'package:flutter/material.dart';
import 'package:t_savaari/common/components/circular_container.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/features/my_orders/screens/cancelled_order_details/widgets/location_point_widget.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

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
    return Container(
      width: SizeConfig.blockSizeHorizontal * 45,
      height: SizeConfig.blockSizeVertical * 20,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            TImages.imgCompletedStatusQr,
            height: SizeConfig.blockSizeHorizontal * 155,
            fit: BoxFit.fitHeight,
          ),
          Transform.rotate(
            angle: -0.5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.greenColor1,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'COMPLETED',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusAndTime() {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Completed', style: AppTextStyle.commonTextStyle3().copyWith(color: AppColors.lightBlueColor1)),
          SizedBox(height: SizeConfig.blockSizeVertical * 0.5),
          Text('Sep 9th, 7:00 PM', style: AppTextStyle.commonTextStyle3().copyWith(color: AppColors.greyColor)),
        ],
      ),
    );
  }

}