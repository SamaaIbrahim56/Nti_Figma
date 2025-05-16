import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nti_figma/core/widgets/custom_svg.dart';
import 'package:nti_figma/features/profile/delete_user/widget/delete_user_widget.dart';
import '../../../core/translation/translation_key.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/profile_container.dart';
class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomAppBar(

        ),
        SizedBox(height: 37,),
        ProfileContainer(title :Text(TranslationKeys.updateProfile.tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.containerText),),
          svg: CustomSvg(path: AppAssets.profile), onTap: () {
            Navigator.pushNamed(context, "UpdateProfile");
          },),
        SizedBox(height: 20,),
        ProfileContainer(title :Text(TranslationKeys.changePassword.tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.containerText),),
          svg: CustomSvg(path:AppAssets.lock), onTap: () {
            Navigator.pushNamed(context, "ChangePassword");
          },),
        SizedBox(height: 20,),
        ProfileContainer(title :Text(TranslationKeys.settings.tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.containerText),),
          svg: CustomSvg(path:AppAssets.setting), onTap: () {
            Navigator.pushNamed(context, "Language");
          },),
        SizedBox(height: 20,),
DeleteUserWidget()
      ],
    );
  }
}
