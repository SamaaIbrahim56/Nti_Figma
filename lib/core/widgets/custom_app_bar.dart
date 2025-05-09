import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nti_figma/core/utils/app_colors.dart';
import 'package:nti_figma/features/auth/manager/login_cubit/login_state.dart';
import 'package:nti_figma/features/home/manager/user_cubit/user_cubit.dart';
import 'package:nti_figma/features/home/manager/user_cubit/user_state.dart';

import '../translation/translation_key.dart';
import '../utils/app_assets.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<UserCubit,UserState>(
      builder: (context,state){
        return Row(
          children: [
            InkWell(
              onTap: onTap,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(AppAssets.logo),

              ),
            ),
            SizedBox(width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TranslationKeys.hello.tr,style: TextStyle(fontWeight:FontWeight.w300,fontSize: 12 ,color: AppColors.black),),
                  SizedBox(height: 4,),
                  if(state is UserSuccess)
                  Text(state.userModel.userName??"No Name",style: TextStyle(fontWeight:FontWeight.w300,fontSize: 16  ),),

                ],

              ),
            ),


          ],
        );
      },

    );
  }
}
