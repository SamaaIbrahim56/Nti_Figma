import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_figma/utils/app_assets.dart';
import 'package:nti_figma/utils/app_colors.dart';
import 'package:nti_figma/utils/custom_app_bar.dart';
import 'package:nti_figma/utils/profile_container.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            onPlusTap: (){
              Navigator.pushNamed(context, "AddTask");
            },
          ),
          SizedBox(height: 37,),
          ProfileContainer(title :Text("Update Profile",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.containerText),),
               svg: SvgPicture.asset("${AppAssets.profile}"), onTap: () {
            Navigator.pushNamed(context, "UpdateProfile");
            },),
          SizedBox(height: 20,),
          ProfileContainer(title :Text("Change Password",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.containerText),),
              svg: SvgPicture.asset("${AppAssets.lock}"), onTap: () {
                        Navigator.pushNamed(context, "ChangePassword");
                        },),
          SizedBox(height: 20,),
          ProfileContainer(title :Text("Settings",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.containerText),),
              svg: SvgPicture.asset("${AppAssets.setting}"), onTap: () {
                                    Navigator.pushNamed(context, "Language");
                                    },),


        ],
      ),
    );
  }
}
