import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/dashed_line.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/my_orders/models/orders_model.dart';
import 'package:t_savaari/routes/routes.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({
    super.key, 
    required this.order
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GestureDetector(
      onTap: () {
        _navigateToDetailScreen(context, order.status);
      },
      child: CustomPaint(
        painter: TicketPainter(),
        child: Container(
          // decoration: BoxDecoration(
          //   border: Border.all(color: AppColors.primaryColor),
          //   borderRadius: BorderRadius.circular(8),
          // ),
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
                          order.ticketCount.toString(),
                          style: AppTextStyle.ticketNumberTextStyle(),
                        ),
                        Text(
                          'Ticket',
                          style: AppTextStyle.commonTextStyle3(),
                        ),
                      ],
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
                    DashedLine(length: SizeConfig.blockSizeVertical * 10, isVertical: true),
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
                                      style: AppTextStyle.commonTextStyle17().copyWith(color: AppColors.lightGreyColor3),
                                    ),
                                    Text(
                                      order.startLocation,
                                      style: AppTextStyle.commonTextStyle3(),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Icon(Icons.arrow_forward, size: SizeConfig.blockSizeHorizontal * 4),
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
                                      style: AppTextStyle.commonTextStyle17().copyWith(color: AppColors.lightGreyColor3),
                                    ),
                                    Text(
                                      order.endLocation,
                                      style: AppTextStyle.commonTextStyle3(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 0.5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Ticket Date and Status
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order.status.label,
                                    style: AppTextStyle.commonTextStyle19().copyWith(
                                      color: order.status.color,
                                    ),
                                  ),
                                  SizedBox(height: SizeConfig.blockSizeVertical * 0.5),
                                  Text(
                                    _formatDateTime(order.dateTime),
                                    style: AppTextStyle.commonTextStyle19(),
                                  ),
                                ],
                              ),
        
                              // Buy Again Button
                              Padding(
                                padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 2),
                                child: SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 20,
                                  height: SizeConfig.blockSizeVertical * 4,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, Routes.qrTicketBookingPage);
                                    },
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: AppColors.primaryColor,
                                      side: const BorderSide(color: AppColors.primaryColor),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Buy Again',
                                        style: AppTextStyle.commonTextStyle19().copyWith(color: AppColors.primaryColor),
                                      ),
                                    ),
                                  ),
                                ),
                              )
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
    );
  }

  void _navigateToDetailScreen(BuildContext context, OrderStatus status) {
    switch (status) {
      case OrderStatus.ongoing:
        Navigator.pushNamed(context, Routes.upComingOrderDetailsPage);
        break;
      case OrderStatus.completed:
        Navigator.pushNamed(context, Routes.completedOrderDetailsPage);
        break;
      case OrderStatus.cancelled:
        Navigator.pushNamed(context, Routes.cancelledOrderDetailsPage);
        break;
      default:
        break;
    }
  }

  String _formatDateTime(DateTime dateTime) {
    final month = _getMonthAbbreviation(dateTime.month);
    final day = dateTime.day;
    final hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final formattedHour = hour > 12 ? hour - 12 : hour;

    return '$month ${day}th, $formattedHour:$minute $period';
  }

  String _getMonthAbbreviation(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
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
