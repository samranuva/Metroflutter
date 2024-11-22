import 'package:get/get.dart';
import 'package:t_savaari/bottom_navigation/bottom_navigation_menu.dart';
import 'package:t_savaari/routes/routes.dart';
import 'package:t_savaari/features/authentication/login/screens/login.dart';
import 'package:t_savaari/features/authentication/otp/screens/otp.dart';
import 'package:t_savaari/features/authentication/register/screens/registration.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/screens/qr_ticket_booking.dart';
import 'package:t_savaari/features/do%E2%80%99s%20&%20dont%E2%80%99s/do_and_dont.dart';
import 'package:t_savaari/features/fare_calculation/screens/fare_calculation.dart';
import 'package:t_savaari/features/feedback/screens/feedback.dart';
import 'package:t_savaari/features/metro_network_map/screens/metro_network_map.dart';
import 'package:t_savaari/features/my_orders/screens/cancelled_order_details/cancel_order_details.dart';
import 'package:t_savaari/features/my_orders/screens/completed_order_details/completed_order_details.dart';
import 'package:t_savaari/features/my_orders/screens/my_orders/my_orders.dart';
import 'package:t_savaari/features/my_orders/screens/upcoming_order_details/upcoming_order_details.dart';
import 'package:t_savaari/features/notifications/screens/notifications.dart';
import 'package:t_savaari/features/offers/screens/offers.dart';
import 'package:t_savaari/features/profile/screens/profile.dart';
import 'package:t_savaari/features/station_facilities/screens/10_vehicle_parking/parking.dart';
import 'package:t_savaari/features/station_facilities/screens/11_platform_info/platform_info.dart';
import 'package:t_savaari/features/station_facilities/screens/web_view/web_view.dart';
import 'package:t_savaari/features/station_facilities/screens/4_bus_stop/bus_stop.dart';
import 'package:t_savaari/features/station_facilities/screens/9_imp_catchment_area/imp_catchment_area.dart';
import 'package:t_savaari/features/station_facilities/screens/station_facilities_dashboard.dart';
import 'package:t_savaari/features/travel_history/screens/travel_history.dart';
import 'package:t_savaari/features/view_balance_or_recharge/screens/recent_recharges_list.dart';
import 'package:t_savaari/features/view_balance_or_recharge/screens/recharge.dart';
import 'package:t_savaari/features/view_balance_or_recharge/screens/view_balance_recharge_info.dart';
import 'package:t_savaari/features/view_balance_or_recharge/screens/view_balance_recharge.dart';
import '../features/station_facilities/screens/8_neighbourhood_area/neighbourhood_area.dart';


class AppRoutes {
  static final pages = [

    GetPage(
      name: Routes.loginPage, 
      page: () =>  const LoginScreen(),
    ),

    GetPage(
      name: Routes.registrationPage, 
      page: () => const RegistrationPage()
    ),
    
     GetPage(
      name: Routes.otpPage, 
      page: () =>  const OtpInputScreen()
    ),


    GetPage(
      name: Routes.homePage, 
      page: () => const BottomNavigationMenu()
    ),
    
    GetPage(
      name: Routes.profilePage, 
      page: () => const ProfileScreen()
    ),
    
    GetPage(
      name: Routes.qrTicketBookingPage, 
      page: () => const QRTicketBookingScreen()
    ),
    
    GetPage(
      name: Routes.dOsAndDONTsPage, 
      page: () => const DOsAndDONTsScreen()
    ),
    
    GetPage(
      name: Routes.travelHistoryPage, 
      page: () => const TravelHistoryScreen()
    ),
    
     GetPage(
      name: Routes.metroFareCalculationPage, 
      page: () => const FareCalculationScreen()
    ),
    
    GetPage(
      name: Routes.metroNetworkMapPage, 
      page: () => const MetroNetworkMapScreen()
    ),
    
    GetPage(
      name: Routes.offersPage, 
      page: () => const OffersScreen()
    ),
    
    GetPage(
      name: Routes.feedbackPage, 
      page: () => FeedbackScreen()
    ),
    
     GetPage(
      name: Routes.notificationsPage, 
      page: () => const NotificationsScreen()
    ),


    
     GetPage(
      name: Routes.stationFacilitiesPage, 
      page: () => const StationFacilitiesScreen()
    ),
    
    GetPage(
      name: Routes.webViewScreen, 
      page: () => const WebViewScreen()
    ),
    
    GetPage(
      name: Routes.platformInformationPage, 
      page: () => const PlatformInformationScreen()
    ),
    
    GetPage(
      name: Routes.busStopPage, 
      page: () =>  BusStopScreen()
    ),
    
    GetPage(
      name: Routes.impCatchmentAreaPage, 
      page: () => const ImpCatchmentAreaScreen()
    ),
    
    GetPage(
      name: Routes.neighbourhoodAreasPage, 
      page: () => const NeighbourhoodAreasScreen()
    ),
    
     GetPage(
      name: Routes.parkingPage, 
      page: () => const ParkingScreen()
    ),


    
    GetPage(
      name: Routes.viewBalanceOrRechargePage, 
      page: () => const ViewBalanceOrRechargeScreen()
    ),
    
    GetPage(
      name: Routes.viewBalanceRechargeInfoPage, 
      page: () => const ViewBalanceRechargeInfoScreen()
    ),
    
    GetPage(
      name: Routes.rechargePage, 
      page: () => const RechargeScreen()
    ),
    
    GetPage(
      name: Routes.recentRechargesListPage, 
      page: () => const RecentRechargesListScreen()
    ),


    
    GetPage(
      name: Routes.myOrdersPage, 
      page: () => const MyOrdersScreen()
    ),
    
     GetPage(
      name: Routes.completedOrderDetailsPage, 
      page: () => const CompletedOrderDetailsScreen()
    ),
    
    GetPage(
      name: Routes.cancelledOrderDetailsPage, 
      page: () => const CancelledOrderDetailsScreen()
    ),
    
    GetPage(
      name: Routes.upComingOrderDetailsPage, 
      page: () => const UpComingOrderDetailsScreen()
    ),
    
     
  ];
}
