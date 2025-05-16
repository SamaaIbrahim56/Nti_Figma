import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nti_figma/core/cache/cache_data.dart';
import 'package:nti_figma/core/cache/cache_helper.dart';
import 'package:nti_figma/core/translation/translation_helper.dart';
import 'package:nti_figma/features/home/manager/user_cubit/user_cubit.dart';
import 'package:nti_figma/features/splash/splash_screen.dart';
import 'package:nti_figma/features/tasks/tasks_screen.dart';
import 'features/home/home_screen.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/constant.dart';
import 'features/add_task/add_task_screen.dart';
import 'features/auth/login_screen.dart';
import 'features/auth/register_screen.dart';
import 'features/change_password/change_password_screen.dart';
import 'features/language/language_screen.dart';
import 'features/profile/profile_screen.dart';
import 'features/update_profile/update_profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await TranslationHelper.setLanguage();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>UserCubit(),
      child: GetMaterialApp(
        locale: Locale(CacheData.language!),
        translations: TranslationHelper(),
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBackground,
          fontFamily: AppConstants.fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          "RegisterScreen": (context) => RegisterScreen(),
          "LoginScreen": (context) => Loginscreen(),
          "HomeScreen": (context) => HomeScreen(),
          "ProfileScreen": (context) => ProfileScreen(),
          "UpdateProfile": (context) => UpdateProfile(),
          "ChangePassword": (context) => ChangePassword(),
          "Language": (context) => Language(),
          "AddTask": (context) => AddTask(),
          "TaskScreen": (context) => TasksScreen(),
        },
        home: Splash(),
      ),
    );
  }
}
