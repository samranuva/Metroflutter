import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/common/widgets/appbar/t_appbar.dart';
import 'package:t_savaari/common/widgets/notifications/notification_icon.dart';
import 'package:t_savaari/features/authentication/login/controllers/user_controller.dart';
import 'package:t_savaari/routes/routes.dart';
import 'package:t_savaari/utils/constants/colors.dart';
import 'package:t_savaari/utils/constants/image_strings.dart';
import 'package:t_savaari/utils/constants/sizes.dart';
import 'package:t_savaari/utils/constants/text_strings.dart';
import 'package:t_savaari/utils/device/device_utility.dart';
import 'package:t_savaari/utils/loaders/shimmer_effect.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      showBackArrow: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: TColors.white,
            backgroundImage: AssetImage(TImages.appLogo),
          ),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.homeAppbarTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: TColors.grey),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 4,
              ),
              Obx(
                () {
                  if (controller.isProfileLoading.value) {
                    return const ShimmerEffect(width: 80, height: 15);
                  }
                  return SizedBox(
                    width: TDeviceUtils.getScreenWidth(context) / 2,
                    child: Text(
                      // controller.user.value.fullname,
                      'Hi, Sam ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyle.commonTextStyle9()
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        NotificationIcon(
          onPressed: () => Get.toNamed(Routes.notificationsPage),
        ),
      ],
    );
  }
}
