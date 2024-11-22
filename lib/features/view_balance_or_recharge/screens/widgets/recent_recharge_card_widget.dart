import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/dashed_line.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/view_balance_or_recharge/models/recent_recharge_model.dart';

class RecentRechargeCard extends StatelessWidget {
  final RecentRechargeModel recentRecharge;

  const RecentRechargeCard({
    super.key, 
    required this.recentRecharge
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Stack(
      children : [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal:  SizeConfig.blockSizeHorizontal * 5,
            vertical:  SizeConfig.blockSizeVertical * 1.2
          ),
          child: CustomPaint(
            painter: TicketPainter(),
            child: Container(
              // margin: EdgeInsets.symmetric(
              //   horizontal:  SizeConfig.blockSizeHorizontal * 5,
              //   vertical:  SizeConfig.blockSizeVertical * 1.2
              // ),
              // decoration: BoxDecoration(
              //   border: Border.all(color: AppColors.primaryColor),
              //   borderRadius: BorderRadius.circular(8),
              // ),
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              TImages.walletIcon, 
                              height: SizeConfig.blockSizeHorizontal * 10,
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical * 0.5),
                            Text(
                              '₹${recentRecharge.addedAmount}',
                              style: AppTextStyle.commonTextStyle5(),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical * 0.5),
                            Text(
                              'Added Amount',
                              style: AppTextStyle.commonTextStyle13(),
                            ),
                          ],
                        ),
                        SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
                        DashedLine(length: SizeConfig.blockSizeVertical * 10, isVertical: true,),
                        SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order Id  : ${recentRecharge.orderId}',
                                style: AppTextStyle.commonTextStyle7(),
                              ),
              
                              SizedBox(height: SizeConfig.blockSizeVertical * 1),
            
                              Text(
                                'Transaction Status : Success',
                                style: AppTextStyle.commonTextStyle7().copyWith(color: AppColors.greenColor),
                              ),
            
                              SizedBox(height: SizeConfig.blockSizeVertical * 1),
            
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded( 
                                    flex: 2,
                                    child: Text(
                                      'Placed Date : ${recentRecharge.date}',
                                      //ticket.date,
                                      style: AppTextStyle.commonTextStyle17().copyWith(color: AppColors.greyColor)
                                    ),
                                  ),
            
                                  Expanded( 
                                    child: Text(
                                      recentRecharge.time,
                                      style: AppTextStyle.commonTextStyle17().copyWith(color: AppColors.greyColor)
                                    ),
                                  ),
            
                                  
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: SizeConfig.blockSizeHorizontal * 2.5,
          top: 0,
          child: SvgPicture.asset(
            TImages.greenCheckIcon, 
            height: SizeConfig.blockSizeHorizontal * 8,
          ),
        )
      ]
    );
  }
}




class TicketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final double notchRadius =  SizeConfig.blockSizeHorizontal * 2;
    final double notchOffset = SizeConfig.blockSizeHorizontal * 21; // Adjust the offset as needed
    final Path path = Path();

    // Start from top-left
    path.moveTo(0, notchRadius);
    path.quadraticBezierTo(0, 0, notchRadius, 0);
    
    // Top edge with notch
    path.lineTo(size.width / 2 - notchRadius - notchOffset, 0);
    path.arcToPoint(
      Offset(size.width / 2 + notchRadius - notchOffset, 0),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.lineTo(size.width - notchRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, notchRadius);
    
    // Right edge
    path.lineTo(size.width, size.height - notchRadius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - notchRadius, size.height);
    
    // Bottom edge with notch
    path.lineTo(size.width / 2 + notchRadius - notchOffset, size.height);
    path.arcToPoint(
      Offset(size.width / 2 - notchRadius - notchOffset, size.height),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.lineTo(notchRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - notchRadius);
    
    // Left edge
    path.lineTo(0, notchRadius);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
