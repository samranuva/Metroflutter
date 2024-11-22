import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class PaymentDetailsRow extends StatelessWidget {
  final String label;
  final String value;
  
  const PaymentDetailsRow({
    super.key, 
    required this.label, 
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyle.commonTextStyle19().copyWith(color: AppColors.lightGreyColor3)),
          SizedBox(height: SizeConfig.blockSizeVertical * 0.5),
          Text(value, style: AppTextStyle.commonTextStyle3()),
        ],
      ),
    );
  }
}