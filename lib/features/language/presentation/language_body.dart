import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_figma/core/translation/translation_key.dart';
import 'package:nti_figma/features/language/manager/language_cubit/language_cubit.dart';
import 'package:nti_figma/features/language/manager/language_cubit/language_state.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_svg.dart';

class LanguageBody extends StatelessWidget {
  const LanguageBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CustomSvg(path: AppAssets.arrow_back),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.36),
                    Text(
                      TranslationKeys.settings.tr,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w300,
                        color: AppColors.containerText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TranslationKeys.language.tr,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: AppColors.containerText,
                      ),
                    ),
                    Container(
                      width: 102,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.switchColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                LanguageCubit.get(context).changeArLanguage();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      LanguageCubit.get(context).isEnglish
                                          ? Colors.transparent
                                          : AppColors.backgroundButtom,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  TranslationKeys.ar.tr,
                                  style: TextStyle(
                                    color:
                                        LanguageCubit.get(context).isEnglish
                                            ? AppColors.containerText
                                            : Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // English
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                LanguageCubit.get(context).changeEnLanguage();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      LanguageCubit.get(context).isEnglish
                                          ? AppColors.backgroundButtom
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  TranslationKeys.en.tr,
                                  style: TextStyle(
                                    color:
                                        LanguageCubit.get(context).isEnglish
                                            ? Colors.white
                                            : AppColors.containerText,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
