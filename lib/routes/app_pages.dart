import 'package:clarity/feature/signin/screen/view/wellcome_screen.dart';
import 'package:clarity/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:clarity/dashbord/screen/dashbord_screen.dart';
import 'package:clarity/feature/signin/screen/signin_screen.dart';
import 'package:clarity/feature/signup/view/screen/home_screen.dart';
import 'package:clarity/feature/signup/view/screen/setting_screen.dart';
import 'package:clarity/feature/signup/view/screen/signup_screen.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.onboarding: (context) => WellcomeScreen(),
    AppRoutes.home: (context) => const HomeScreen(),
    AppRoutes.login: (context) => const SigninScreen(),
    AppRoutes.register: (context) => const SignupScreen(),
    AppRoutes.main: (context) => const DashbordScreen(),
    AppRoutes.profile: (context) => const SettingScreen(),
  };
}
