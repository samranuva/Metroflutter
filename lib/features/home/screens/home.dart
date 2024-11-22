import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/features/home/screens/widgets/header_section_container.dart';
import 'package:t_savaari/features/home/screens/widgets/home_app_bar.dart';
import 'package:t_savaari/features/home/screens/widgets/image_slider.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/routes/routes.dart'; // Import routes
import 'package:t_savaari/features/home/screens/widgets/menu_item_card.dart';
import 'package:t_savaari/features/home/screens/widgets/menu_item_widget.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/features/media/media.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    
    return Scaffold(
      body: _buildUI(context),
      // drawer: const SideDrawer(),
      // body: Builder( 
      //   builder: (BuildContext context) {
      //     return _buildUI(context);
      //   },
      // ),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Column(
      children: [
        //Appbar
        HeaderSectionContainer(
          child: Padding(
            padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 3.5),
            child: const HomeAppBar(),
          ),
        ),


        // Background Image at the top
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:  SizeConfig.blockSizeHorizontal * 0),
          child: const ImageSlider(
            autoPlay: true,
          ),
        ),
        
    
        Expanded(
          child: _buildHomeContent(context),
        ),
      ],
    );
  }


  // Widget _buildUI(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       //const HomeTopBar(),
  //       _buildBanner(),
  //       _buildHomeContent(context),
  //     ],
  //   );
  // }

  // Widget _buildBanner() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 5),
  //     child: Image.asset(
  //       TImages.homeBanner, 
  //       fit: BoxFit.fitWidth,
  //       height: SizeConfig.blockSizeVertical * 14,
  //     ),
  //   );
  // }

  Widget _buildHomeContent(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3.5),
      children: [
        _buildMenuItemsSection(context),
        SizedBox(height: SizeConfig.blockSizeVertical * 4),
        _buildMenuItemCards(context),
      ],
    );
  }

  // Widget _buildHomeContent(BuildContext context) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: AppColors.whiteColor,
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(SizeConfig.blockSizeVertical * 3),
  //         topRight: Radius.circular(SizeConfig.blockSizeVertical * 3),
  //       ),
  //     ),
  //     child: ListView(
  //       physics: const NeverScrollableScrollPhysics(),
  //       padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3.5),
  //       children: [
  //         _buildMenuItemsSection(context),
  //         SizedBox(height: SizeConfig.blockSizeVertical * 4),
  //         _buildMenuItemCards(context),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildMenuItemsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1.5),
          child: Text(
            'Safe Journey with Hyderabad',
            style: AppTextStyle.commonTextStyle5()
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MenuItemWidget(
              onTap: () => Get.toNamed(Routes.qrTicketBookingPage),
              image: TImages.homeItem1, 
              label: 'Book QR Ticket',
              color: AppColors.purpleColor,
            ),
            MenuItemWidget(
              onTap: () => Get.toNamed(Routes.metroNetworkMapPage),
              image: TImages.homeItem2, 
              label: 'Network',
              color: AppColors.darkPinkColor,
            ),
            MenuItemWidget(
              onTap: () => Get.toNamed(Routes.dOsAndDONTsPage),
              image: TImages.homeItem3, 
              label: 'Do\'s & Dont\'s',
              color: AppColors.darkBeigeColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuItemCards(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical * 32, // Adjust height as needed
          child: GridView.count(
            crossAxisCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            crossAxisSpacing: SizeConfig.blockSizeHorizontal * 2.5,
            mainAxisSpacing: SizeConfig.blockSizeVertical * 1.5,
            children: [
              MenuItemCard(
                onTap: () => Get.toNamed(Routes.travelHistoryPage),
                image: TImages.homeItem4,
                label: 'Travel History\nQR/Card',
                color: AppColors.lightPurpleColor,
              ),
              MenuItemCard(
                onTap: () => Get.toNamed(Routes.metroFareCalculationPage),
                image: TImages.homeItem5, 
                label: 'Fare\nCalculation',
                color: AppColors.lightPinkColor,
              ),
              MenuItemCard(
                onTap: () => Get.toNamed(Routes.stationFacilitiesPage),
                image: TImages.homeItem6, 
                label: 'Station\nFacilities',
                color: AppColors.lightBlueColor,
              ),
              MenuItemCard(
                onTap: () => Get.toNamed(Routes.viewBalanceOrRechargePage),
                image: TImages.homeItem7, 
                label: 'View Balance/\nRecharge',
                color: AppColors.creamColor,
              ),
              MenuItemCard(
                onTap: () => Get.toNamed(Routes.myOrdersPage),
                image: TImages.homeItem8, 
                label: 'My Orders',
                color: AppColors.lightBeigeColor,
              ),
              MenuItemCard(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const MediaAlertBox(),
                  );
                },
                image: TImages.homeItem9, 
                label: 'Media',
                color: AppColors.lightPurpleColor2,
              ),
            ],
          ),
        ),
        // _buildPenaltyImage(context),
      ],
    );
  }


}
