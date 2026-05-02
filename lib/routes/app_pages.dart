import 'package:clarity/feature/task/view/screen/add_task_screen.dart';
import 'package:clarity/feature/wellcome/view/screen/wellcome_screen.dart';
import 'package:clarity/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:clarity/feature/dashbord/screen/dashbord_screen.dart';
import 'package:clarity/feature/signin/view/screen/signin_screen.dart';
import 'package:clarity/feature/home_feature/view/screen/home_screen.dart';
import 'package:clarity/feature/setting/view/screen/setting_screen.dart';
import 'package:clarity/feature/signup/view/screen/signup_screen.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.onboarding: (context) => WellcomeScreen(),
    AppRoutes.home: (context) => const HomeScreen(),
    AppRoutes.login: (context) => const SigninScreen(),
    AppRoutes.register: (context) => const SignupScreen(),
    AppRoutes.main: (context) => const DashbordScreen(),
    AppRoutes.profile: (context) => const SettingScreen(),
    AppRoutes.task: (context) => const AddTaskScreen(),
  };
}
