import 'package:t_savaari/features/my_orders/models/orders_model.dart';
import 'package:t_savaari/features/view_balance_or_recharge/models/recent_recharge_model.dart';
import 'package:t_savaari/features/travel_history/models/ticket_model.dart';

  final List<TravelTicket> tickets = [
    TravelTicket(
      ticketNumber: 1,
      from: 'Nagole',
      to: 'Ameerpet',
      date: 'Sep 9th, 7:00 PM',
      status: TicketStatus.onGoing,
      paymentMethod: PaymentMethod.qr,
    ),
    TravelTicket(
      ticketNumber: 1,
      from: 'Nagole',
      to: 'Assembly',
      date: 'Sep 10th, 7:00 PM',
      status: TicketStatus.completed,
      paymentMethod: PaymentMethod.card,
    ),
    TravelTicket(
      ticketNumber: 2,
      from: 'Nagole',
      to: 'HighTech City',
      date: 'Sep 9th, 7:00 PM',
      status: TicketStatus.cancelled,
      paymentMethod: PaymentMethod.qr,
    ),
    TravelTicket(
      ticketNumber: 1,
      from: 'Dr.B.R.Ambedkar Balngr',
      to: 'Uppal',
      date: 'Sep 22nd, 7:00 PM',
      status: TicketStatus.completed,
      paymentMethod: PaymentMethod.qr,
    ),
    TravelTicket(
      ticketNumber: 3,
      from: 'Nagole',
      to: 'Ameerpet',
      date: 'Sep 9th, 7:00 PM',
      status: TicketStatus.completed,
      paymentMethod: PaymentMethod.qr,
    ),

    TravelTicket(
      ticketNumber: 2,
      from: 'Nagole',
      to: 'Dr.B.R.Ambedkar Balngr',
      date: 'Sep 9th, 7:00 PM',
      status: TicketStatus.cancelled,
      paymentMethod: PaymentMethod.qr,
    ),
    TravelTicket(
      ticketNumber: 1,
      from: 'Nagole',
      to: 'Ameerpet',
      date: 'Sep 9th, 7:00 PM',
      status: TicketStatus.completed,
      paymentMethod: PaymentMethod.qr,
    ),
    TravelTicket(
      ticketNumber: 3,
      from: 'Nagole',
      to: 'Ameerpet',
      date: 'Sep 9th, 7:00 PM',
      status: TicketStatus.completed,
      paymentMethod: PaymentMethod.qr,
    ),
  ];


  final List<RecentRechargeModel> recentRecharges = [
    RecentRechargeModel(
      orderId: "5f600585c956549178",
      addedAmount: "100",
      time: "18:45:30",
      date: "06/09/2024",
    ),
    RecentRechargeModel(
      orderId: "5f600585c956549179",
      addedAmount: "500",
      time: "14:30:45",
      date: "07/09/2024",
    ),
    RecentRechargeModel(
      orderId: "5f600585c956549180",
      addedAmount: "75",
      time: "16:15:20",
      date: "08/09/2024",
    ),
    RecentRechargeModel(
      orderId: "5f600585c956549181",
      addedAmount: "200",
      time: "09:50:10",
      date: "09/09/2024",
    ),
    RecentRechargeModel(
      orderId: "5f600585c956549182",
      addedAmount: "150",
      time: "12:05:55",
      date: "10/09/2024",
    ),
    RecentRechargeModel(
      orderId: "5f600585c956549178",
      addedAmount: "100",
      time: "18:45:30",
      date: "06/09/2024",
    ),
    RecentRechargeModel(
      orderId: "5f600585c956549179",
      addedAmount: "500",
      time: "14:30:45",
      date: "07/09/2024",
    ),
    RecentRechargeModel(
      orderId: "5f600585c956549180",
      addedAmount: "75",
      time: "16:15:20",
      date: "08/09/2024",
    ),
    RecentRechargeModel(
      orderId: "5f600585c956549181",
      addedAmount: "200",
      time: "09:50:10",
      date: "09/09/2024",
    ),
    RecentRechargeModel(
      orderId: "5f600585c956549182",
      addedAmount: "150",
      time: "12:05:55",
      date: "10/09/2024",
    ),
  ];


  final List<Order> sampleOrders = [
    Order(
      startLocation: 'Nagole',
      endLocation: 'Ameerpet',
      dateTime: DateTime(2024, 9, 5, 19, 0), // Sep 5th, 7:00 PM
      status: OrderStatus.ongoing,
      ticketCount: 1,
    ),
    Order(
      startLocation: 'Uppal',
      endLocation: 'Ameerpet',
      dateTime: DateTime(2024, 9, 5, 19, 0),
      status: OrderStatus.completed,
      ticketCount: 1,
    ),
    Order(
      startLocation: 'Hitec City',
      endLocation: 'Ameerpet',
      dateTime: DateTime(2024, 9, 5, 19, 0),
      status: OrderStatus.cancelled,
      ticketCount: 1,
    ),

    Order(
      startLocation: 'Assembly',
      endLocation: 'Dr.B.R.Ambedkar Balngr',
      dateTime: DateTime(2024, 9, 5, 19, 0), // Sep 5th, 7:00 PM
      status: OrderStatus.ongoing,
      ticketCount: 1,
    ),
    Order(
      startLocation: 'Dr.B.R.Ambedkar Balngr',
      endLocation: 'HighTech City',
      dateTime: DateTime(2024, 9, 5, 19, 0),
      status: OrderStatus.completed,
      ticketCount: 1,
    ),
    Order(
      startLocation: 'Hitec City',
      endLocation: 'Ameerpet',
      dateTime: DateTime(2024, 9, 5, 19, 0),
      status: OrderStatus.cancelled,
      ticketCount: 1,
    ),

    Order(
      startLocation: 'Hitec City',
      endLocation: 'MTVT',
      dateTime: DateTime(2024, 9, 5, 19, 0),
      status: OrderStatus.cancelled,
      ticketCount: 1,
    ),
    
  ];

  final List<String> stations = [
    // Red Line (Miyapur to LB Nagar)
    "Miyapur",
    "JNTU College",
    "KPHB Colony",
    "Kukatpally",
    "Balanagar",
    "Moosapet",
    "Bharat Nagar",
    "Erragadda",
    "ESI Hospital",
    "S R Nagar",
    "Ameerpet", // Interchange with Blue Line
    "Punjagutta",
    "Irrum Manzil",
    "Khairatabad",
    "Lakdikapul",
    "Assembly",
    "Nampally",
    "Gandhi Bhavan",
    "Osmania Medical College",
    "MG Bus Station (MGBS)", // Interchange with Green Line
    "Malakpet",
    "New Market",
    "Musarambagh",
    "Dilsukhnagar",
    "Chaitanyapuri",
    "Victoria Memorial",
    "LB Nagar",

    // Blue Line (Nagole to Raidurg)
    "Nagole",
    "Uppal",
    "Stadium",
    "NGRI",
    "Habsiguda",
    "Tarnaka",
    "Mettuguda",
    "Secunderabad East",
    "Paradise",
    "Rasoolpura",
    "Prakash Nagar",
    "Begumpet",
    "Madhura Nagar",
    "Yusufguda",
    "Jubilee Hills Road No. 5",
    "Jubilee Hills Check Post",
    "Peddamma Temple",
    "Madhapur",
    "Durgam Cheruvu",
    "Hitec City",
    "Raidurg",

    // Green Line (JBS Parade Ground to MGBS)
    "JBS Parade Ground",
    "Secunderabad West",
    "Gandhi Hospital",
    "Musheerabad",
    "RTC Cross Roads",
    "Chikkadpally",
    "Narayanaguda",
    "Sultan Bazaar",
  ].toSet().toList();
