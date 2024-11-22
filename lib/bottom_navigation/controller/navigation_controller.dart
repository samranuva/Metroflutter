import 'package:get/get.dart';
import 'package:t_savaari/features/home/screens/home.dart';
import 'package:t_savaari/features/menu/screens/menu.dart';
import 'package:t_savaari/features/my_orders/screens/my_orders/my_orders.dart';
import 'package:t_savaari/features/travel_history/screens/travel_history.dart';


class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const TravelHistoryScreen(),
    const MyOrdersScreen(),
    const MenuScreen()
  ];

  void onDestinationSelectionChange(int index) {
    selectedIndex.value = index;
  }
}
