import 'package:clarity/feature/signin/view/controller/signin_cubit_controller.dart';
import 'package:clarity/feature/signup/view/controller/signup_cubit_controller.dart';
import 'package:clarity/feature/task/view/controller/add_task_cubit.dart';
import 'package:clarity/firebase_options.dart';
import 'package:clarity/routes/app_pages.dart';
import 'package:clarity/routes/app_routes.dart';
import 'package:clarity/core/theme/app_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => Clarity(), // Wrap your app
    ),
  );
}

class Clarity extends StatelessWidget {
  const Clarity({super.key});

  // This widget is the  root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => AddTaskCubit()),
      ],

      child: MaterialApp(
        title: 'Clarity',
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        initialRoute: AppRoutes.onboarding,
        routes: AppPages.routes,
      ),
    );
  }
}
