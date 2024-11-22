// models/travel_ticket.dart

import 'package:flutter/material.dart';
import 'package:t_savaari/utils/constants/color.dart';

enum TicketStatus {
  onGoing,
  completed,
  cancelled,
}

enum PaymentMethod {
  qr,
  card,
}

class TravelTicket {
  final int ticketNumber;
  final String from;
  final String to;
  final String date;
  final TicketStatus status;
  final PaymentMethod paymentMethod;

  TravelTicket({
    required this.ticketNumber,
    required this.from,
    required this.to,
    required this.date,
    required this.status,
    required this.paymentMethod,
  });

  String getStatusText() {
    switch (status) {
      case TicketStatus.onGoing:
        return 'On Going';
      case TicketStatus.completed:
        return 'Completed';
      case TicketStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color getStatusColor() {
    switch (status) {
      case TicketStatus.onGoing:
        return AppColors.greenColor1;
      case TicketStatus.completed:
        return Colors.blue;
      case TicketStatus.cancelled:
        return AppColors.redColor1;
    }
  }

  String getPaymentMethodText() {
    switch (paymentMethod) {
      case PaymentMethod.qr:
        return 'Paid with QR';
      case PaymentMethod.card:
        return 'Paid with Card';
    }
  }
}