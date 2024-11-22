import 'package:flutter/material.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/common/components/dashed_line.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class ParkingScreen extends StatelessWidget {
  const ParkingScreen({super.key});

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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 5,
          vertical: SizeConfig.blockSizeVertical * 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Parking',
              style: AppTextStyle.commonTextStyle4().copyWith(color: AppColors.tertiaryColor),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 3),
            Text(
              '2 Wheeler Paid Parking - 1. Entry Gate B\n2.Between Entry Gate C & D',
              style: AppTextStyle.commonTextStyle10().copyWith(color: AppColors.greyColor1),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2),
              child: const DashedLine(length: double.infinity, isVertical: false, thickness: 1.5, horizontalDashWidth: 4),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Uppal Metro Station',
                style: AppTextStyle.commonTextStyle2().copyWith(color: AppColors.greyColor1),
              ),
            ),

            ///Station Image Section...
            _buildImage(TImages.parkingImg),

            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Parking Tariff Details",
                style: AppTextStyle.commonTextStyle4().copyWith(color: AppColors.tertiaryColor),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 1),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "(as on December 2021)",
                style: AppTextStyle.commonTextStyle14().copyWith(color: AppColors.greyColor1),
              ),
            ),

            ///Tables Section..
            _buildParkHyderabadSection(),
            _buildOperatorBookingSection(),

            ///Note Section...
            Text(
              'Note:-',
              style: AppTextStyle.commonTextStyle4().copyWith(color: AppColors.redColor1),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 1),
            Text(
              '• For monthly pass @ Rs 50/- extra towards\n  card charged',
              style: AppTextStyle.commonTextStyle10().copyWith(color: AppColors.greyColor1),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 5),
          ],
        ),
      ),
    );
  }
  

  Widget _buildParkHyderabadSection() {
    return _buildSectionContainer(
      title: 'ParkHyderabad App based booking',
      rows: [
        _buildRowWithVerticalDivider(['Charges\napplicable', '2\nWheelers', '4\nWheelers'], isHeader: true),
        const Padding(
          padding: EdgeInsets.zero,
          child: Divider(height: 1, thickness: 1, color: AppColors.lightGreyColor2,),
        ),
        _buildRowWithVerticalDivider(['Minimum 2 hrs\nBooking', 'Rs. 4/hr', 'Rs. 12/hr']),
      ],
    );
  }

  Widget _buildOperatorBookingSection() {
    return _buildSectionContainer(
      title: 'Operators Booking @ Parking Slot',
      rows: [
        _buildRowWithVerticalDivider(['Charges\napplicable', '2\nWheelers', '4\nWheelers'], isHeader: true),
        const Padding(
          padding: EdgeInsets.zero,
          child: Divider(height: 1, thickness: 1, color: AppColors.lightGreyColor2,),
        ),
        _buildRowWithVerticalDivider(['0 hr to 3hrs', 'Rs. 15/-', 'Rs. 45/-']),
        const Divider(color: AppColors.lightGreyColor2,),
        _buildRowWithVerticalDivider(['Above 3 hrs', 'Rs. 25/-', 'Rs. 75/-']),
        const Divider(color: AppColors.lightGreyColor2,),
        _buildRowWithVerticalDivider(['Monthly pass', 'Rs. 525/-', 'Rs. 1450/-']),
      ],
    );
  }


  Widget _buildSectionContainer({required String title, required List<Widget> rows}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGreyColor2, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _tableTitleText(title),
            const Padding(
              padding: EdgeInsets.zero,
              child: Divider(height: 1, thickness: 1, color: AppColors.lightGreyColor2,),
            ),
            ...rows,
            SizedBox(height: SizeConfig.blockSizeVertical * 1),
          ],
        ),
      ),
    );
  }

  Widget _tableTitleText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.blockSizeVertical * 2,
        horizontal: SizeConfig.blockSizeHorizontal * 3,
      ),
      child: Text(
        text,
        style: AppTextStyle.commonTextStyle10().copyWith(color: AppColors.greyColor1),
      ),
    );
  }

  Widget _buildRowWithVerticalDivider(List<String> cells, {bool isHeader = false}) {
    return Row(
      children: List.generate(cells.length, (index) {
        return Expanded(
          child: Container(
            color: isHeader ? AppColors.lightGreyColor5 : AppColors.whiteColor,
            child: Row(
              children: [
                if (isHeader && index != 0) SizedBox(
                  height: SizeConfig.blockSizeVertical * 5,
                  child: const VerticalDivider(),
                ), 
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
                    child: Text(
                      cells[index],
                      textAlign: TextAlign.center,
                      style: isHeader
                       ? AppTextStyle.commonTextStyle12().copyWith(color: AppColors.blackColor)
                       : AppTextStyle.commonTextStyle11(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildImage(String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 5,
        vertical: SizeConfig.blockSizeVertical * 2,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.asset(
          imagePath,
          fit: BoxFit.fitHeight,
          width: double.infinity,
        ),
      ),
    );
  }

}
