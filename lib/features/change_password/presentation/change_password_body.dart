import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_figma/features/change_password/manager/change_password_cubit/change_password_cubit.dart';
import 'package:nti_figma/features/change_password/manager/change_password_cubit/change_password_state.dart';
import '../../../core/translation/translation_key.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app border_decoration.dart';
import '../../../core/widgets/elevated button.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit,ChangePasswordState>(
        listener: (context,state){
          if(state is ChangePasswordSuccessState)
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("success")));
          }
          else if(state is ChangePasswordErrorState)
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }

        },
        builder:(context, state){
          return  Form(
            key: ChangePasswordCubit.get(context).formKey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3669,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.logo),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.88,
                        height: MediaQuery.of(context).size.height * 0.0775,
                        child: TextFormField(
                          controller: ChangePasswordCubit.get(context).oldPassword,
                          enabled: true,
                          decoration: InputDecoration(
                            hintText: TranslationKeys.oldPassword.tr,
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
                      SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.88,
                        height: MediaQuery.of(context).size.height * 0.0775,

                        child: TextFormField(
                          controller: ChangePasswordCubit.get(context).newPassword,
                          enabled: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: TranslationKeys.newPassword.tr,
                            hintStyle: TextStyle(color: AppColors.grey, fontSize: 14),
                            enabledBorder: AppBorderDecoration.enabledBorder,
                            disabledBorder: AppBorderDecoration.disabledBorder,
                            focusedBorder: AppBorderDecoration.enabledBorder,
                            errorBorder: AppBorderDecoration.errorBorder,
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return TranslationKeys.fieldRequired.tr;
                            }
                            if (value.length < 8) {
                              return TranslationKeys.passwordLengthError.tr;
                            }
                            if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              return TranslationKeys.passwordUppercaseError.tr;
                            }
                            if (!RegExp(r'[a-z]').hasMatch(value)) {
                              return TranslationKeys.passwordLowercaseError.tr;
                            }


                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.88,
                        height: MediaQuery.of(context).size.height * 0.0775,

                        child: TextFormField(
                          controller: ChangePasswordCubit.get(context).confirmPassword,
                          enabled: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: TranslationKeys.confirmPassword.tr,
                            hintStyle: TextStyle(color: AppColors.grey, fontSize: 14),
                            enabledBorder: AppBorderDecoration.enabledBorder,
                            disabledBorder: AppBorderDecoration.disabledBorder,
                            focusedBorder: AppBorderDecoration.enabledBorder,
                            errorBorder: AppBorderDecoration.errorBorder,
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return TranslationKeys.fieldRequired.tr;
                            }
                            if (value != ChangePasswordCubit.get(context).newPassword.text) {
                              return TranslationKeys.passwordMismatchError.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      GreenElevatedButton.create(
                        child: Text(
                          TranslationKeys.save.tr,
                          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300),
                        ),
                        onPressed: () {
                          ChangePasswordCubit.get(context).savePressed();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },

      ),
    );
  }
}
