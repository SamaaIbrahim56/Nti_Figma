import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/translation/translation_key.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/app border_decoration.dart';
import '../../core/widgets/elevated button.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(AppAssets.logo),
          SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.all(23.0),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: MediaQuery.of(context).size.height * 0.0775,
                  child: TextFormField(
                    controller: userController,
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
