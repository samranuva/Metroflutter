import 'package:flutter/material.dart';
import 'package:t_savaari/utils/constants/color.dart';

class Order {
  final String startLocation;
  final String endLocation;
  final DateTime dateTime;
  final OrderStatus status;
  final int ticketCount;

  Order({
    required this.startLocation,
    required this.endLocation,
    required this.dateTime,
    required this.status,
    required this.ticketCount,
  });
}

// Order Status Enum
enum OrderStatus {
  ongoing('OnGoing', AppColors.greenColor1),
  completed('Completed', Colors.blue),
  cancelled('Cancelled', AppColors.redColor1);

  final String label;
  final Color color;
  const OrderStatus(this.label, this.color);
}
