import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/widgets/containers/t_circular_container.dart';
import 'package:t_savaari/common/widgets/images/rounded_corner_image.dart';
import 'package:t_savaari/features/home/controllers/banner_controller.dart';
import 'package:t_savaari/utils/constants/colors.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/utils/loaders/shimmer_effect.dart';


class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    this.autoPlay = false,
  });

  final bool autoPlay;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Stack(
      children: [
        Obx(() {
          //Loader
          if (controller.isLoading.value) {
            return const ShimmerEffect(width: double.infinity, height: 180);
          }
          //No data found
          if (controller.bannersList.isEmpty) {
            return const Center(
              child: Text('No Data Found!'),
            );
          }
          return CarouselSlider(
            options: CarouselOptions(
              autoPlay: autoPlay,
              viewportFraction: 1, 
              padEnds: false,       
              onPageChanged: (index, reason) {
                controller.updatePageIndicator(index);
              },
            ),
            items: controller.bannersList
                .map((banner) => RoundedCornerImage(
                      padding:  EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3.5, 
                        vertical: SizeConfig.blockSizeVertical * 0.85, 
                      ),
                      imageUrl: banner.imageUrl,
                      applyBoxShadow: false,
                      isNetworkImage: false,
                      onPressed: () {
                        if (banner.targetPageIndex != null) {
                          // NavigationController.instance
                          //     .onDestinationSelectionChange(
                          //         banner.targetPageIndex!);
                        } else {
                          Get.toNamed(banner.targetScreen);
                        }
                      },
                    ))
                .toList(),
          );
        }),
        // const SizedBox(
        //   height: TSizes.spaceBtwSections,
        // ),
        Positioned(
          top: SizeConfig.blockSizeVertical * 22,
          left: 0,
          right: 0,
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < controller.bannersList.length; i++)
                  TCircularContainer(
                    width: SizeConfig.blockSizeHorizontal * 3,
                    height: SizeConfig.blockSizeVertical * 0.5,
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.grey,
                    margin: const EdgeInsets.only(right: 10),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
