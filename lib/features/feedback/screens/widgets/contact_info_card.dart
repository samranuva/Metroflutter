import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class ContactInfoCard extends StatelessWidget {
  const ContactInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 5,
        vertical: SizeConfig.blockSizeVertical * 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Contact Information', style: AppTextStyle.commonTextStyle3()),
          SizedBox(height: SizeConfig.blockSizeVertical * 2),
          _buildContactRow('Phone', '040-2333-2555'),
          _buildContactRow('Email', 'customerservice@ltmetro.com'),
          _buildContactRow('Website', 'www.ltmetro.com'),
        ],
      ),
    );
  }

  Widget _buildContactRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 20,
            child: Text(
              label,
              style: AppTextStyle.commonTextStyle2().copyWith(color: AppColors.greyColor),
            ),
          ),
          Text(' :   ', style: AppTextStyle.commonTextStyle2().copyWith(color: AppColors.greyColor)),
          Expanded(
            child: Text(
              value,
              style: AppTextStyle.commonTextStyle2().copyWith(color: AppColors.greyColor),
            ),
          ),
        ],
      ),
    );
  }

}