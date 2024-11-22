import 'package:flutter/material.dart';
import 'package:t_savaari/common/components/circular_container.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/features/my_orders/screens/cancelled_order_details/widgets/payement_details_row_widget.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class PaymentDetailsCard extends StatelessWidget {
  const PaymentDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPaymentDetailsCard();
  }

  Widget _buildPaymentDetailsCard() {
    return CircularContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment', style: AppTextStyle.commonTextStyle19()),
          SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
          _buildPaymentDetailsRow(),
          SizedBox(height: SizeConfig.blockSizeVertical * 4),
          GestureDetector(
            onTap: (){},
            child: Text(
              'View Payment Details',
              style: AppTextStyle.commonTextStyle19().copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentDetailsRow() {
    return const Row(
      children: [
        PaymentDetailsRow(label:'Type', value: 'One Way'),
        Spacer(),
        PaymentDetailsRow(label: 'Passenger', value: '1'),
        Spacer(),
        PaymentDetailsRow(label: 'Amount', value: '₹30'),
      ],
    );
  }

}