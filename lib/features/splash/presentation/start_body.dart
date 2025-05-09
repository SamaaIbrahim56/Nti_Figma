import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_figma/core/cache/cache_helper.dart';
import 'package:nti_figma/core/cache/cache_keys.dart';
import 'package:nti_figma/core/widgets/custom_svg.dart';
import '../../../core/translation/translation_key.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/elevated button.dart';

class StartBody extends StatelessWidget {
  const StartBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.16,
        left: 22,
        right: 22,
        bottom: MediaQuery.of(context).size.width * 0.09,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomSvg(
              path: AppAssets.start,
              width: MediaQuery.of(context).size.width * 0.8,
            ),

            Text(
              TranslationKeys.welcomeText1.tr,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              TranslationKeys.welcomeText2.tr,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            GreenElevatedButton.create(
              child: Text(
                TranslationKeys.letStart.tr,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300),
              ),
              onPressed: () async {
                await CacheHelper.saveData(
                  key: CacheKeys.firstTime,
                  value: false,
                );
                Navigator.pushNamed(context, "RegisterScreen");
              },
            ),
          ],
        ),
      ),
    );
  }
}
