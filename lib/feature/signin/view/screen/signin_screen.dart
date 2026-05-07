import 'package:clarity/core/widget/custom_container.dart';
import 'package:clarity/core/widget/custom_elevatedbutton.dart';
import 'package:clarity/core/widget/custom_textfromfield.dart';
import 'package:clarity/feature/signin/view/controller/signin_cubit_controller.dart';
import 'package:clarity/feature/signin/view/screen/signin_state.dart';
import 'package:clarity/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(),

      child: BlocListener<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }

          if (state is SigninSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Login Success')));

            // Navigate to dashboard after 1 second
            final navigator = Navigator.of(context);
            Future.delayed(Duration(seconds: 1), () {
              navigator.pushReplacementNamed(AppRoutes.main);
            });
          }
        },

        child: Scaffold(
          backgroundColor: Color(0xffFAF8FF),

          body: SingleChildScrollView(
            padding: EdgeInsets.all(12),

            child: Column(
              children: [
                SizedBox(height: 60),

                /// LOGO
                Container(
                  height: 150,
                  width: 350,
                  padding: EdgeInsets.all(12),

                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,

                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/clarity 1.png'),
                          ),
                        ),
                      ),

                      Text(
                        'Clarity',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff004AC6),
                        ),
                      ),

                      Flexible(
                        child: Text(
                          'Manage complex schedules with cognitive ease.',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff434655),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                /// FORM
                CustomContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      Text(
                        'Sign in to your account',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff434655),
                        ),
                      ),

                      SizedBox(height: 20),

                      /// EMAIL
                      BlocBuilder<SigninCubit, SigninState>(
                        builder: (context, state) {
                          return CustomTextfromfield(
                            controller: context
                                .read<SigninCubit>()
                                .emailController,
                            prefixIcon: Icon(Icons.email),
                            title: 'EMAIL ADDRESS',
                          );
                        },
                      ),

                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff004AC6),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 5),

                      /// PASSWORD
                      BlocBuilder<SigninCubit, SigninState>(
                        builder: (context, state) {
                          final cubit = context.read<SigninCubit>();
                          return CustomTextfromfield(
                            controller: cubit.passwordController,
                            title: 'PASSWORD',
                            prefixIcon: Icon(Icons.lock),
                            obscureText: !cubit.isPasswordVisible,
                            suffixIcon: Icon(
                              cubit.isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onSuffixIconPressed: () {
                              cubit.togglePasswordVisibility();
                            },
                          );
                        },
                      ),

                      SizedBox(height: 20),

                      /// BUTTON
                      BlocBuilder<SigninCubit, SigninState>(
                        builder: (context, state) {
                          return CustomElevatedbutton(
                            onPressed: () {
                              context.read<SigninCubit>().login();
                            },

                            title: state is SigninLoading
                                ? 'Loading...'
                                : 'Log in',

                            width: double.infinity,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  'Don\'t have an account? Sign Up',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
