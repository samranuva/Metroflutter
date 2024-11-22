import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/dashed_line.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/travel_history/models/ticket_model.dart';
import 'package:t_savaari/routes/routes.dart';

class TicketCard extends StatelessWidget {
  final TravelTicket ticket;

  const TicketCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GestureDetector(
      onTap: () {
        _navigateToDetailScreen(context, ticket.status);
      },
      child: CustomPaint(
        painter: TicketPainter(),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${ticket.ticketNumber}',
                        style: AppTextStyle.ticketNumberTextStyle(),
                      ),
                      Text(
                        'Ticket',
                        style: AppTextStyle.commonTextStyle3(),
                      ),
                    ],
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
                  DashedLine(length: SizeConfig.blockSizeVertical * 10, isVertical: true,),
                  SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: SizeConfig.blockSizeVertical * 6.5,
                              width: SizeConfig.blockSizeHorizontal * 25,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Starting from',
                                    style: AppTextStyle.commonTextStyle16(),
                                  ),
                                  Text(
                                    ticket.from,
                                    style: AppTextStyle.commonTextStyle3(),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Icon(Icons.arrow_forward, size: SizeConfig.blockSizeHorizontal * 4)
                            ),
                            Container(
                              height: SizeConfig.blockSizeVertical * 6.5,
                              width: SizeConfig.blockSizeHorizontal * 25,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Going to',
                                    style: AppTextStyle.commonTextStyle16(),
                                  ),
                                  Text(
                                    ticket.to,
                                    style: AppTextStyle.commonTextStyle3(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                
                        SizedBox(height: SizeConfig.blockSizeVertical * 0.5),
                
                        Text(
                          ticket.getStatusText(),
                          style: TextStyle(
                            color: ticket.getStatusColor(),
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 2.8,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Ticket Date.....
                            Expanded( 
                              child: Text(
                                ticket.date,
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: SizeConfig.blockSizeHorizontal * 2.8,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                
                            ///Payment Method...
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 2,
                                vertical: SizeConfig.blockSizeVertical * 0.5,
                              ),
                              decoration: BoxDecoration(
                                color: ticket.paymentMethod == PaymentMethod.qr
                                    ? AppColors.lightGreenColor
                                    : AppColors.lightPurpleColor3,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                ticket.getPaymentMethodText(),
                                style: TextStyle(
                                  color: ticket.paymentMethod == PaymentMethod.qr
                                      ? AppColors.greenColor
                                      : AppColors.purpleColor1,
                                  fontSize: SizeConfig.blockSizeHorizontal * 2.6,
                                ),
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
    );
  }

  void _navigateToDetailScreen(BuildContext context, TicketStatus status) {
    switch (status) {
      case TicketStatus.onGoing:
        Get.toNamed(Routes.upComingOrderDetailsPage); 
        break;
      case TicketStatus.completed:
        Get.toNamed(Routes.completedOrderDetailsPage); 
        break;
      case TicketStatus.cancelled:
        Get.toNamed(Routes.cancelledOrderDetailsPage); 
        break;
      default:
        break;
    }
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
    final double notchOffset = SizeConfig.blockSizeHorizontal * 26.8; // Adjust the offset as needed
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
