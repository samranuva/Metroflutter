import 'package:flutter/material.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/utils/constants/constant_data.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/view_balance_or_recharge/screens/widgets/recent_recharge_card_widget.dart';

class RecentRechargesListScreen extends StatelessWidget {
  const RecentRechargesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CommonAppBar(title: 'Recent Recharges'),
      body: _buildRecentRechargesList()
    );
  }

  Widget _buildRecentRechargesList() {
    return ListView.builder(
      itemCount: recentRecharges.length,
      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 3),
      itemBuilder: (context, index) {
        return RecentRechargeCard(
          recentRecharge: recentRecharges[index],
        );
      },
    );
  }

}