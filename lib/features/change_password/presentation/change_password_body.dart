import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/translation/translation_key.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app border_decoration.dart';
import '../../../core/widgets/elevated button.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
                    controller: oldPasswordController,
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
                    controller: newPasswordController,
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
                      if (!RegExp(r'\d').hasMatch(value)) {
                        return TranslationKeys.passwordNumberError.tr;
                      }
                      if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                        return TranslationKeys.passwordSpecialCharError.tr;
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
                    controller: confirmPasswordController,
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
                      if (value != newPasswordController.text) {
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
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
