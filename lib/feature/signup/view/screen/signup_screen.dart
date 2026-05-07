import 'package:clarity/core/widget/custom_textfromfield.dart';
import 'package:clarity/routes/app_routes.dart';
import 'package:clarity/core/widget/custom_container.dart';
import 'package:clarity/core/widget/custom_elevatedbutton.dart';
import 'package:clarity/core/widget/custom_securitycontainer.dart';
import 'package:clarity/feature/signup/view/controller/signup_cubit_controller.dart';
import 'package:clarity/feature/signup/view/screen/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocListener<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }

          if (state is SignupSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Signup successful')));
            final navigator = Navigator.of(context);
            Future.delayed(Duration(seconds: 1), () {
              if (!mounted) return;
              navigator.pushReplacementNamed(AppRoutes.main);
            });
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'join',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight(800),
                      ),
                    ),
                    Text(
                      'Clarity',
                      style: TextStyle(
                        color: Color(0XFF2563EB),
                        fontSize: 32,
                        fontWeight: FontWeight(800),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Start your journey toward cognitive calm.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight(400),
                    color: Color(0XFF434655),
                  ),
                ),
                SizedBox(height: 20),
                CustomContainer(
                  child: Column(
                    spacing: 40,
                    children: [
                      CustomTextfromfield(
                        controller: context
                            .read<SignupCubit>()
                            .fullNameController,
                        title: 'Full Name',
                      ),
                      CustomTextfromfield(
                        controller: context.read<SignupCubit>().emailController,
                        title: 'Email Address',
                      ),
                      CustomTextfromfield(
                        controller: context
                            .read<SignupCubit>()
                            .passwordController,
                        title: 'Password',
                        obscureText: true,
                      ),
                      CustomTextfromfield(
                        controller: context
                            .read<SignupCubit>()
                            .confirmPasswordController,
                        title: 'Confirm Password',
                        obscureText: true,
                      ),
                      Column(
                        spacing: 20,
                        children: [
                          BlocBuilder<SignupCubit, SignupState>(
                            builder: (context, state) {
                              return CustomElevatedbutton(
                                onPressed: () => Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.main,
                                ),
                                title: 'Sign Up',
                                width: 300,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  },
                  child: Text(
                    'Already have an account? Sign in',
                    style: TextStyle(
                      color: Color(0XFF434655),
                      fontSize: 14,
                      fontWeight: FontWeight(400),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomSecuritycontainer(
                  icon: Icons.security,
                  title:
                      'Your data is encrypted and stored'
                      'securely. We never share your personal'
                      'information with third parties.',
                  color: Color(0XFFD0E1FB),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
