import 'package:get/get.dart';
import 'package:t_savaari/features/my_orders/models/orders_model.dart';
import 'package:t_savaari/utils/constants/constant_data.dart';

class OrdersController extends GetxController {
  static OrdersController get instance => Get.find();

  // Order lists for different statuses
  RxList<Order> ongoingOrders = RxList<Order>();
  RxList<Order> completedOrders = RxList<Order>();
  RxList<Order> cancelledOrders = RxList<Order>();

  @override
  void onInit() {
    super.onInit();
    _initializeOrders();
  }

  void _initializeOrders() {
    ongoingOrders.value = _getFilteredOrders(OrderStatus.ongoing);
    completedOrders.value = _getFilteredOrders(OrderStatus.completed);
    cancelledOrders.value = _getFilteredOrders(OrderStatus.cancelled);
  }

  List<Order> _getFilteredOrders(OrderStatus status) {
    return sampleOrders.where((order) => order.status == status).toList();
  }


}
