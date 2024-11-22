import 'package:flutter/material.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class JourneyOptionCard extends StatelessWidget {
  final String label;
  final int price;
  final bool isSelected;
  final void Function()? onTap;

  const JourneyOptionCard({
    super.key,
    required this.label, 
    required this.price, 
    required this.isSelected, 
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? AppColors.primaryColor : AppColors.lightGreyColor4,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? Colors.blue.withOpacity(0.1) : null,
          ),
          child: Column(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? AppColors.primaryColor : AppColors.lightGreyColor3,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 0.5),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '₹$price ',
                      style: TextStyle(
                        color: isSelected ? AppColors.primaryColor : AppColors.lightGreyColor3,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockSizeHorizontal * 3.3,
                      ),
                    ),
                    TextSpan(
                      text: 'person',
                      style: TextStyle(
                        color: isSelected ? AppColors.primaryColor : AppColors.lightGreyColor3,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockSizeHorizontal * 2.5,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}