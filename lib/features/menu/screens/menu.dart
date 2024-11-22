import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_savaari/common/components/circular_container.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/features/media/media.dart';
import 'package:t_savaari/features/menu/screens/widgets/menu_tile.dart';
import 'package:t_savaari/features/menu/screens/widgets/user_info_card.dart';
import 'package:t_savaari/routes/routes.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final deviceStorage = GetStorage();

    return Scaffold(
      backgroundColor: AppColors.lightGreyColor5,
      appBar:const CommonAppBar(title: "Account"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 2,
              vertical: SizeConfig.blockSizeVertical * 1
            ),
            child: Column(
              children: [
                const UserInfoWidget(),
                SizedBox(height: SizeConfig.blockSizeVertical * 1),

                CircularContainer(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      ProfileTileWidget(
                        icon: TImages.drawerBalance,
                        title: 'View Balance /Recharge',
                        onTap: () => Get.toNamed(Routes.viewBalanceOrRechargePage),
                      ),
                      ProfileTileWidget(
                        icon: TImages.drawerProfile,
                        title: 'My Profile',
                        onTap: () => Get.toNamed(Routes.profilePage),
                      ),
                      ProfileTileWidget(
                        icon: TImages.drawerCalc,
                        title: 'Fare Calculation',
                        onTap: () => Get.toNamed(Routes.metroFareCalculationPage),
                      ),
                      ProfileTileWidget(
                        icon: TImages.drawerMedia,
                        title: 'Media',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const MediaAlertBox(),
                          );
                        },
                      ),
                      
                    ]
                  ),
                ),

                SizedBox(height: SizeConfig.blockSizeVertical * 1.5),
                              
                CircularContainer(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      ProfileTileWidget(
                        icon: TImages.drawerBell,
                        title: 'Notifications',
                        onTap: () => Get.toNamed(Routes.notificationsPage),
                      ),
                      ProfileTileWidget(
                         icon: TImages.drawerOffers,
                          title: 'Offers',
                          onTap: () => Get.toNamed(Routes.offersPage),
                      ),
                      ProfileTileWidget(
                        icon: TImages.drawerFeedback,
                        title: 'Feedback',
                        onTap: () => Get.toNamed(Routes.feedbackPage),
                      ),
                      ProfileTileWidget(
                        onTap: (){
                          printStorageValues();
                          Get.snackbar(
                            "Terms of Service", "Comming Soon...!",
                            backgroundColor: AppColors.lightBlueColor
                          );
                        },
                        icon: TImages.drawerTerms,
                        title: 'Terms of Service',
                      ),    
                    ]
                  ),
                ),

                SizedBox(height: SizeConfig.blockSizeVertical * 3),
            
                CircularContainer(
                  padding: EdgeInsets.zero,
                  child: ProfileTileWidget(
                    onTap: () async {
                      await deviceStorage.remove('access_token');
                      await deviceStorage.remove('refresh_token');
                      Get.offAllNamed(Routes.loginPage);
                    },
                    title: "Log out",
                    icon: TImages.drawerLogout,
                  ),
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }


  void printStorageValues() {
    final box = GetStorage();
    final keys = box.getKeys();

    if (keys.isEmpty) {
      print("Storage is empty.");
    } else {
      for (var key in keys) {
        print('Key: $key, Value: ${box.read(key)}');
      }
    }
  }

}