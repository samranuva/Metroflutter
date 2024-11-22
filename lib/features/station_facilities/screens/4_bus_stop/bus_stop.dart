import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/common/components/dashed_line.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/station_facilities/screens/4_bus_stop/widgets/bus_number_card.dart';
import 'package:t_savaari/features/station_facilities/screens/4_bus_stop/widgets/gate_selector_botton.dart';
import 'package:t_savaari/features/station_facilities/screens/4_bus_stop/controllers/bus_stop_controller.dart';

class BusStopScreen extends StatelessWidget {
  BusStopScreen({super.key});

  // Initialize the controller
  final BusStopController _controller = Get.put(BusStopController());

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CommonAppBar(title: "Station Facilities"),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 5,
        vertical: SizeConfig.blockSizeVertical * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bus Stops',
            style: AppTextStyle.commonTextStyle4().copyWith(color: AppColors.tertiaryColor),
          ),
          _buildGateSelector(),
          _buildDashedLine(top: 0, bottom: 3),
          _buildBusNumberRow(_controller.busNumbersRow1),
          _buildDashedLine(top: 3, bottom: 3),
          _buildBusNumberRow(_controller.busNumbersRow2),
        ],
      ),
    );
  }

  Widget _buildGateSelector() {
    return Obx(() => GateSelector(
          gates: _controller.gates,
          selectedGate: _controller.selectedGate.value,
          onGateSelected: (gate) {
            _controller.updateGate(gate);
          },
        ));
  }

  Widget _buildBusNumberRow(List<String> busNumbers) {
    return Wrap(
      spacing: SizeConfig.blockSizeHorizontal * 5,
      runSpacing: SizeConfig.blockSizeVertical * 1,
      children: busNumbers.map((number) => BusNumberCard(number: number)).toList(),
    );
  }

  Widget _buildDashedLine({required int top, required int bottom}) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * top,
        bottom: SizeConfig.blockSizeVertical * bottom,
      ),
      child: const DashedLine(length: double.infinity, isVertical: false, thickness: 1.5, horizontalDashWidth: 4),
    );
  }
}
