import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/features/my_orders/models/orders_model.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/my_orders/controllers/orders_controller.dart';
import 'package:t_savaari/features/my_orders/screens/my_orders/widgets/order_item_card.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> with SingleTickerProviderStateMixin {
  final OrdersController controller = Get.put(OrdersController());
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CommonAppBar(
        title: 'My Orders',
        bottom: _buildTabBar(),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTicketList(controller.ongoingOrders),
          _buildTicketList(controller.completedOrders),
          _buildTicketList(controller.cancelledOrders),
        ],
      )
    );
  }

  PreferredSize _buildTabBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(SizeConfig.blockSizeVertical * 6.5),
      child: Container(
        color: AppColors.whiteColor,
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 6.5,
          child: TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xFF576EDB),
            labelColor: AppColors.blackColor,
            labelStyle: AppTextStyle.commonTextStyle2(),
            unselectedLabelColor: AppColors.blackColor,
            tabs: const [
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTicketList(RxList<Order> orders) {
    return Obx(() => orders.isEmpty
        ? const Center(
            child: Text(
              'No Orders Found',
              style: TextStyle(color: Colors.grey),
            ),
          )
        : ListView.builder(
            padding: EdgeInsets.fromLTRB(
              SizeConfig.blockSizeHorizontal * 5,
              SizeConfig.blockSizeHorizontal * 5,
              SizeConfig.blockSizeHorizontal * 5,
              SizeConfig.blockSizeVertical * 10, // Bottom padding
            ),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Padding(
                padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
                child: OrderCard(order: order),
              );
            },
          ));
  }
}
