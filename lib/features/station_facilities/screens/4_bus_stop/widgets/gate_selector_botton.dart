import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class GateSelector extends StatelessWidget {
  final List<String> gates;
  final String selectedGate;
  final ValueChanged<String> onGateSelected;

  const GateSelector({
    super.key,
    required this.gates,
    required this.selectedGate,
    required this.onGateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 3),
        child: Row(
          children: gates.map((gate) {
            bool isSelected = selectedGate == gate;
            return Padding(
              padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
              child: InkWell(
                onTap: () => onGateSelected(gate),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 5,
                    vertical: SizeConfig.blockSizeVertical * 0.8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.tertiaryColor : AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? AppColors.tertiaryColor : AppColors.lightGreyColor4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    gate,
                    style: AppTextStyle.commonTextStyle6().copyWith(
                      color: isSelected ? AppColors.whiteColor : AppColors.greyColor,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
