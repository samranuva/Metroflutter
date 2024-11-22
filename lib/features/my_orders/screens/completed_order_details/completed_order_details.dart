import 'package:flutter/material.dart';
import 'package:t_savaari/features/my_orders/screens/cancelled_order_details/widgets/close_button.dart';
import 'package:t_savaari/features/my_orders/screens/completed_order_details/widgets/journey_details_card.dart';
import 'package:t_savaari/features/my_orders/screens/completed_order_details/widgets/payment_details_card.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class CompletedOrderDetailsScreen  extends StatelessWidget {
  const CompletedOrderDetailsScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: _buildUI(context)
    );
  }

  Widget _buildUI(BuildContext context){
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
          child: Column(
            children: [
              const CloseBackButton(),
              SizedBox(height: SizeConfig.blockSizeVertical * 4),
              const JourneyDetailsCard(),
              SizedBox(height: SizeConfig.blockSizeVertical * 4),
              const PaymentDetailsCard(),
            ],
          ),
        ),
      );
  }

}
