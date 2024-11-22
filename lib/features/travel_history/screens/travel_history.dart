import 'package:flutter/material.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/utils/constants/constant_data.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/travel_history/screens/widgets/ticket_card_widget.dart';

class TravelHistoryScreen extends StatelessWidget {
  const TravelHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CommonAppBar(title: "Travel History QR / Card"),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(
          SizeConfig.blockSizeHorizontal * 5,
          SizeConfig.blockSizeHorizontal * 5,
          SizeConfig.blockSizeHorizontal * 5,
          SizeConfig.blockSizeVertical * 10, // Bottom padding
        ),
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
            child: TicketCard(ticket: tickets[index]),
          );
        },
      )

    );
  }  
}

