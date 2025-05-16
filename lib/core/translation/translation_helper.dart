import 'package:get/get.dart';
import 'package:nti_figma/core/translation/translation_key.dart';

import '../cache/cache_data.dart';
import '../cache/cache_helper.dart';
import '../cache/cache_keys.dart';
import 'ar.dart';
import 'en.dart';

class TranslationHelper implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    CacheKeys.keyAR: ar,
    CacheKeys.keyEN: en,
  };

  static Future setLanguage() async
  {
    CacheData.language = await CacheHelper.getData(key: CacheKeys.langKey);

    if (CacheData.language == null)
    {
      await CacheHelper.saveData(
          key: CacheKeys.langKey, value: CacheKeys.keyEN);
      await Get.updateLocale(TranslationKeys.localeEN);
      CacheData.language = CacheKeys.keyEN;
    }
  }

  static changeLanguage(bool isAr)async
  {
    if(isAr)
    {
      await CacheHelper.saveData(
          key: CacheKeys.langKey, value: CacheKeys.keyAR);
      await Get.updateLocale(TranslationKeys.localeAR);
      CacheData.language = CacheKeys.keyAR;
    }
    else
    {
      await CacheHelper.saveData(
          key: CacheKeys.langKey, value: CacheKeys.keyEN);
      await Get.updateLocale(TranslationKeys.localeEN);
      CacheData.language = CacheKeys.keyEN;
    }

  }
}