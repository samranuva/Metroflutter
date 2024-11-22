import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/common/components/dashed_line.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/station_facilities/screens/4_bus_stop/widgets/gate_selector_botton.dart';

class ImpCatchmentAreaScreen extends StatefulWidget {
  const ImpCatchmentAreaScreen({super.key});

  @override
  State<ImpCatchmentAreaScreen> createState() => _ImpCatchmentAreaScreenState();
}

class _ImpCatchmentAreaScreenState extends State<ImpCatchmentAreaScreen> {
  String selectedGate = 'Gate A';
  final List<String> gates = ['Gate A', 'Gate D'];
  final Map<String, List<String>> gateLocations = {
    'Gate A': [
      'Yadagiri gutta',
      'Uppal market',
      'Uppal post office',
      'Pride Resort',
      'Uppal police station',
      'Gatkeskar',
      'Big Bazar',
    ],
    'Gate D': [
      'DA Uppal',
      'Survay colony Road',
    ],
  };

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
            'Important Catchment Area',
            style: AppTextStyle.commonTextStyle4().copyWith(color: AppColors.tertiaryColor)
          ),
          _buildGateSelector(),
          const DashedLine(length: double.infinity, isVertical: false, thickness: 1.5, horizontalDashWidth: 4),
          _buildAreasList(),
        ],
      ),
    );
  }

  Widget _buildAreasList() {
    return Expanded(
      child: ListView.separated(
        itemCount: gateLocations[selectedGate]?.length ?? 0,
        separatorBuilder: (_, __) => const DashedLine(length: double.infinity, isVertical: false, thickness: 1.5, horizontalDashWidth: 4),
        itemBuilder: (_, index) {
          final locations = gateLocations[selectedGate] ?? [];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1.5),
            child: Row(
              children: [
                Text(
                  '${index + 1}. ',
                  style: AppTextStyle.commonTextStyle10().copyWith(color: AppColors.greyColor),
                ),
                Text(
                  locations[index],
                  style: AppTextStyle.commonTextStyle10().copyWith(color: AppColors.greyColor),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  Widget _buildGateSelector() {
    return GateSelector(
      gates: gates,
      selectedGate: selectedGate,
      onGateSelected: (gate) {
        setState(() {
          selectedGate = gate;
        });
      },
    );
  }


}