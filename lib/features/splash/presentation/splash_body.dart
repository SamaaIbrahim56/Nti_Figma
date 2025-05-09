import 'package:flutter/material.dart';
import 'package:nti_figma/core/cache/cache_data.dart';
import 'package:nti_figma/core/cache/cache_helper.dart';
import 'package:nti_figma/core/cache/cache_keys.dart';
import 'package:nti_figma/core/widgets/custom_svg.dart';
import 'package:nti_figma/features/home/home_screen.dart';
import '../../../core/utils/app_assets.dart';
import '../../auth/login_screen.dart';
import '../start_screen.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});
  void navigate(context) {
    Future.delayed(Duration(seconds: 3), () {
      CacheData.loginTime = CacheHelper.getData(key: CacheKeys.loginTime);
      CacheData.firstTime = CacheHelper.getData(key: CacheKeys.firstTime);
      if (CacheData.firstTime != null&&CacheData.loginTime==null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>Loginscreen()),
        );
      } else if(CacheData.firstTime == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StartScreen()),
        );
      }else if(CacheData.loginTime!=null){
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen()),);

      }

    });
  }

  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CustomSvg(
            path: AppAssets.splash,
            width: MediaQuery.of(context).size.width * 0.9,
          ),
        ),
      ],
    );
  }
}
