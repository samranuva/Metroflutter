import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_savaari/common/styles/app_style.dart';
import 'package:t_savaari/features/feedback/controllers/feedback_controller.dart';
import 'package:t_savaari/features/feedback/screens/widgets/contact_info_card.dart';
import 'package:t_savaari/features/feedback/screens/widgets/feedback_img_source_bottom_sheet.dart';
import 'package:t_savaari/utils/constants/color.dart';
import 'package:t_savaari/common/components/common_appbar.dart';
import 'package:t_savaari/common/components/custom_borderded_textfield.dart';
import 'package:t_savaari/common/components/custom_elevated_button.dart';
import 'package:t_savaari/utils/constants/size_config.dart';
import 'package:t_savaari/features/feedback/screens/widgets/dotted_border_button.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({super.key});

  final FeedbackController controller = Get.put(FeedbackController());


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CommonAppBar(title: "Feedback"),
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContactInfoCard(),
            SizedBox(height: SizeConfig.blockSizeVertical * 3),

            Text('Suggestions', style: AppTextStyle.commonTextStyle2()),
            SizedBox(height: SizeConfig.blockSizeVertical * 2),
            const CustomBorderedTextField(
              hintText: 'Subject',
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
            const CustomBorderedTextField(
              hintText: 'Description', 
              maxLines: 4,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 3),

            Text('Upload Screenshot', style: AppTextStyle.commonTextStyle2()),
            SizedBox(height: SizeConfig.blockSizeVertical * 1),
            Text(
              'Note: File size must be less than 100kb',
              style: AppTextStyle.commonTextStyle1().copyWith(color: AppColors.redColor),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 2),

            _buildAttachmentUploader(context),
            Obx(() {
              if (controller.attachmentName.value != null) {
                return Column(
                  children: [
                    SizedBox(height: SizeConfig.blockSizeVertical * 2),
                    _buildAttachmentDisplay(),
                  ],
                );
              }
              return const SizedBox.shrink();
            }),
            SizedBox(height: SizeConfig.blockSizeVertical * 3),

            _buildSaveButton(),
          ],
        ),
      ),
    );
  }


  Widget _buildAttachmentUploader(BuildContext context) {
    return DottedBorderButton(
      onPressed: () => showImageSourceModalSheet(context),
    );
  }


  Widget _buildAttachmentDisplay() {
    return Container(
      width: double.infinity,
      height: SizeConfig.blockSizeVertical * 5.5,
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor2,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 10),
      child: Center(
        child: Obx(() => Text(
          controller.attachmentName.value ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: AppTextStyle.commonTextStyle11().copyWith(color: AppColors.whiteColor),
        )),
      ),
    );
  }


  Widget _buildSaveButton() {
    return Align(
      alignment: Alignment.topCenter,
      child: CustomElevatedButton(
        height: SizeConfig.blockSizeVertical * 5,
        width: SizeConfig.blockSizeHorizontal * 40,
        text: 'Save',
        onPressed: controller.submitFeedback,
      ),
    );
  }



}

  
