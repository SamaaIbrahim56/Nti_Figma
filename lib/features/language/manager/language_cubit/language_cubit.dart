import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_figma/features/language/manager/language_cubit/language_state.dart';

import '../../../../core/translation/translation_helper.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitState()) {
    _initLanguage();
  }
  static LanguageCubit get(context) => BlocProvider.of(context);
  bool isEnglish = true;
  void _initLanguage() {
    final currentLang = Get.locale?.languageCode;
    if (currentLang == 'ar') {
      isEnglish = false;
      emit(LanguageARState());
    } else {
      isEnglish = true;
      emit(LanguageENState());
    }
  }

  void changeArLanguage() {
    isEnglish = false;
    TranslationHelper.changeLanguage(true);
    emit(LanguageARState());
  }

  void changeEnLanguage() {
    isEnglish = true;
    TranslationHelper.changeLanguage(false);
    emit(LanguageENState());
  }
}
