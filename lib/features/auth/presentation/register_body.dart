import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_figma/core/widgets/image_manager/image_manager_view.dart';
import 'package:nti_figma/features/auth/manager/register_cubit/register_cubit.dart';
import 'package:nti_figma/features/auth/manager/register_cubit/register_state.dart';
import '../../../core/translation/translation_key.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app border_decoration.dart';
import '../../../core/widgets/elevated button.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Form(
            key: RegisterCubit.get(context).formKey,
            child: Column(
              children: [
               ImageManagerView(onPicked: (XFile image){
                 RegisterCubit.get(context).image =image;

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

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.88,
                        height: MediaQuery.of(context).size.height * 0.0775,
                        child: TextFormField(
                          controller:
                              RegisterCubit.get(context).userController,
                          enabled: true,
                          decoration: InputDecoration(
                            hintText: TranslationKeys.Username.tr,
                            hintStyle: TextStyle(
                              color: AppColors.grey,
                              fontSize: 14,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder:
                                AppBorderDecoration.enabledBorder,
                            disabledBorder:
                                AppBorderDecoration.disabledBorder,
                            focusedBorder:
                                AppBorderDecoration.enabledBorder,
                            errorBorder: AppBorderDecoration.errorBorder,
                            focusedErrorBorder:
                                AppBorderDecoration.errorBorder,
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
                          controller:
                              RegisterCubit.get(context).passwordController,
                          enabled: true,
                          obscureText:
                              RegisterCubit.get(context).isPasswordVisible,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText:TranslationKeys.password.tr,
                            hintStyle: TextStyle(
                              color: AppColors.grey,
                              fontSize: 14,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                RegisterCubit.get(context).isPasswordVisible
                                    ? Icons.lock_open
                                    : Icons.lock,
                              ),
                              onPressed: () {
                                RegisterCubit.get(
                                  context,
                                ).changePasswordVisibility();
                              },
                            ),
                            enabledBorder:
                                AppBorderDecoration.enabledBorder,
                            disabledBorder:
                                AppBorderDecoration.disabledBorder,
                            focusedBorder:
                                AppBorderDecoration.enabledBorder,
                            errorBorder: AppBorderDecoration.errorBorder,
                            focusedErrorBorder:
                                AppBorderDecoration.errorBorder,
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
                            if (!RegExp(r'\d').hasMatch(value)) {
                              return TranslationKeys.passwordNumberError.tr;
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
                          controller:
                              RegisterCubit.get(
                                context,
                              ).confirmPasswordController,
                          enabled: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: TranslationKeys.confirmPassword.tr,
                            hintStyle: TextStyle(
                              color: AppColors.grey,
                              fontSize: 14,
                            ),
                            enabledBorder:
                                AppBorderDecoration.enabledBorder,
                            disabledBorder:
                                AppBorderDecoration.disabledBorder,
                            focusedBorder:
                                AppBorderDecoration.enabledBorder,
                            errorBorder: AppBorderDecoration.errorBorder,
                            focusedErrorBorder:
                                AppBorderDecoration.errorBorder,
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return TranslationKeys.fieldRequired.tr;
                            }
                            if (value !=
                                RegisterCubit.get(
                                  context,
                                ).passwordController.text) {
                              return TranslationKeys.passwordMismatchError.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      GreenElevatedButton.create(
                        child: Text(
                          TranslationKeys.register.tr,
                          style: TextStyle(fontSize: 19),
                        ),
                        onPressed: () {
                          RegisterCubit.get(context).onRegisterPressed();
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
          TranslationKeys.alreadyHaveAccount.tr,                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'LoginScreen');
                            },
                            child: Text(
                              TranslationKeys.login.tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.pushNamed(context, 'LoginScreen');
            ScaffoldMessenger.of(
              context,
            ).showSnackBar((SnackBar(content: Text("Success"))));
          } else if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              (SnackBar(
                content: Text("${state.error}"),
                backgroundColor: Colors.red,
              )),
            );
          }else if(state is RegisterLoadingState){
            Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
