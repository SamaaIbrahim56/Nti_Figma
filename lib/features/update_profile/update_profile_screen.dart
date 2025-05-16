import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_figma/features/update_profile/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:nti_figma/features/update_profile/manager/update_profile_cubit/update_profile_state.dart';
import '../../core/translation/translation_key.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/app border_decoration.dart';
import '../../core/widgets/elevated button.dart';
import '../../core/widgets/image_manager/image_manager_view.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context)=>ProfileCubit() ,
        child: BlocConsumer<ProfileCubit,UpdateProfileState>(
          listener:   (context, state)
          {
            if(state is UpdateProfileSuccessState)
            {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("success")));
            }
            else if(state is UpdateProfileErrorState)
            {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
            }

          },builder: (context, state) {
    return
     Form(
            key: ProfileCubit.get(context).formKey,
            child: Column(
              children: [
                ImageManagerView(onPicked: (XFile image){
                 ProfileCubit.get(context).image =image;

                },
                  pickedBody: (XFile image){
                    return  Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.366,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(File(image.path)),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    );
                  },
                  unPickedBody:  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.366,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.logo),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 23),
                Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.88,
                        height: MediaQuery.of(context).size.height * 0.0775,
                        child: TextFormField(
                          controller: ProfileCubit.get(context).userName,
                          enabled: true,
                          decoration: InputDecoration(
                            hintText:TranslationKeys.username.tr,
                            hintStyle: TextStyle(color: AppColors.grey, fontSize: 14),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: AppBorderDecoration.enabledBorder,
                            disabledBorder: AppBorderDecoration.disabledBorder,
                            focusedBorder: AppBorderDecoration.enabledBorder,
                            errorBorder: AppBorderDecoration.errorBorder,
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return TranslationKeys.fieldRequired.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 27),
                      GreenElevatedButton.create(
                        child: Text(
                            TranslationKeys.update.tr,
                          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 19),
                        ),
                        onPressed: () {
                          ProfileCubit.get(context).UpdatePressed();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
     );
          }
          ),
        ),
      );
  }
}
