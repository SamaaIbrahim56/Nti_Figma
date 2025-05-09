import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_figma/features/auth/manager/login_cubit/login_cubit.dart';
import 'package:nti_figma/features/auth/manager/login_cubit/login_state.dart';
import 'package:nti_figma/features/home/manager/user_cubit/user_cubit.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_keys.dart';
import '../../../core/translation/translation_key.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app border_decoration.dart';
import '../../../core/widgets/elevated button.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});

  final LoginCubit loginCubit = LoginCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<LoginCubit, LoginState>(
            builder: (context, state) {
              return Form(
                key: LoginCubit.get(context).formKey,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 298,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppAssets.logo),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(23.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.88,
                            height: MediaQuery.of(context).size.height * 0.0775,
                            child: TextFormField(
                              controller:
                                  LoginCubit.get(context).userController,
                              enabled: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: TranslationKeys.Username.tr,
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
                                  LoginCubit.get(context).passwordController,
                              enabled: true,
                              obscureText:
                                  LoginCubit.get(context).passwordVisible,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: TranslationKeys.Password.tr,
                                hintStyle: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 14,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    LoginCubit.get(context).passwordVisible
                                        ? Icons.lock_open
                                        : Icons.lock,
                                  ),
                                  onPressed: () {
                                    LoginCubit.get(
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
                          SizedBox(height: 23),
                          GreenElevatedButton.create(
                            child: Text(
                                TranslationKeys.login.tr,                              style: TextStyle(fontSize: 19),
                            ),
                            onPressed: () async{
                              LoginCubit.get(context).onLoginPressed();
                              await CacheHelper.saveData(
                                key: CacheKeys.loginTime,
                                value: false,
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                TranslationKeys.dontHaveAccount.tr,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    'RegisterScreen',
                                  );
                                },
                                child: Text(
                                  TranslationKeys.register.tr,
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
            listener: (context, state) async{
              if (state is LoginSuccessState) {

                UserCubit.get(context).getUserData(user: state.userModel);
                Navigator.pushNamed(context, 'HomeScreen');
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar((SnackBar(content: Text("Success"))));
              } else if (state is LoginErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  (SnackBar(
                    content: Text("${LoginCubit.get(context).error}"),
                    backgroundColor: Colors.red,
                  )),
                );
              }
            },
          );
        },
      ),
    );
  }
}
