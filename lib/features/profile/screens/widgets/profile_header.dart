import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:t_savaari/features/profile/controllers/profile_controller.dart';
import 'package:t_savaari/features/profile/screens/widgets/image_source_bottom_sheet.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/utils/constants/colors.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/size_config.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildHeader(context);
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeConfig.blockSizeVertical * 10,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            color: TColors.primary,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                SizeConfig.screenWidth,
                SizeConfig.blockSizeVertical * 15,
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
            child: Stack(
              alignment: Alignment.center,
              children: [
                _buildProfileImage(),
                //_buildCameraIcon(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Obx(
      ()=> Container(
        width: SizeConfig.blockSizeHorizontal * 30,
        height: SizeConfig.blockSizeHorizontal * 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(255, 243, 241, 246),
          border: Border.all(color: AppColors.lightBlueColor3, width: 3),
        ),
        child: ProfileController.instance.profileImage.value == null
            ? Padding(
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
              child: SvgPicture.asset(
                  TImages.profileImg,
                  fit: BoxFit.cover,
                ),
            )
            : ClipOval(
                child: Image.file(
                  ProfileController.instance.profileImage.value!,
                  fit: BoxFit.cover,
                  width: SizeConfig.blockSizeHorizontal * 30,
                  height: SizeConfig.blockSizeHorizontal * 30,
                ),
              ),
      ),
    );
  }

  Widget _buildCameraIcon(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          const ImageSourceModalSheet().showImageSourceModalSheet(context); // Open dialog to choose camera or gallery
        },
        child: SvgPicture.asset(
          TImages.cameraIconBordered,
          height: SizeConfig.blockSizeHorizontal * 10,
        ),
      ),
    );
  }


}