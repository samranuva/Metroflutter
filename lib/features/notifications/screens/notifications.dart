import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/notifications/screens/widgets/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CommonAppBar(title: "Notifications",),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.blockSizeVertical * 2),
            Text(
              "Notifications",
              style: AppTextStyle.commonTextStyle6().copyWith(color: AppColors.greyColor)
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 1,),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      NotificationCard(
                        title: "Extension of Timing",
                        content:
                            "Dear Passenger, The tickets for today’s IPL match would be available from 2245 hrs to 2359 hrs to be booked on our apps from Uppal.",
                        date: "1 min ago",
                        backgroundColor: Colors.grey[200]!,
                        sideColor: Colors.grey,
                      ),
                      NotificationCard(
                        title: "Today’s IPL match",
                        content:
                            "Dear Passenger, The tickets for today’s IPL match, please select Stadium Metro station as your destination while booking.",
                        date: "16/05/2024",
                        backgroundColor: Colors.pink[50]!,
                        sideColor: Colors.pink,
                      ),
                      NotificationCard(
                        title: "Extension of Timing",
                        content:
                            "Dear Passenger, The tickets for today’s IPL match would be available from 2245 hrs to 2359 hrs to be booked on our apps from Uppal.",
                        date: "1 min ago",
                        backgroundColor: Colors.yellow[50]!,
                        sideColor: Colors.yellow,
                      ),
                      NotificationCard(
                        title: "Today’s IPL match",
                        content:
                            "Dear Passenger, The tickets for today’s IPL match, please select Stadium Metro station as your destination while booking.",
                        date: "16/05/2024",
                        backgroundColor: Colors.pink[50]!,
                        sideColor: Colors.pink,
                      ),
                    ],
                  );
                },
              )
            ),
          ],
        ),
      ),
  
  
    );
  }
}


