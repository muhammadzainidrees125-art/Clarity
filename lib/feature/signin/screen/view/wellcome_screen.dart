import 'package:clarity/routes/app_routes.dart';
import 'package:clarity/widgets/custom_elevatedbutton.dart';
import 'package:flutter/material.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({super.key});

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  int currentIndex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Skip',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight(600),
                color: Color(0xff2563EB),
              ),
            ),
          ),
        ],
        scrolledUnderElevation: 0,
        backgroundColor: Color(0xffffffff),
        title: Text(
          'Clarity',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight(800),
            color: Color(0xff2563EB),
          ),
        ),
      ),
      backgroundColor: Color(0xffFAF8FF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: [
                  OnboardingPageOne(),
                  Onboardingpagetwo(),
                  Onboardingthree(),
                ],
              ),
            ),

            SizedBox(height: 50),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 3,
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: currentIndex == 0
                            ? Color(0xff004AC6)
                            : Color(0xffC3C6D7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: currentIndex == 1
                            ? Color(0xff004AC6)
                            : Color(0xffC3C6D7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: currentIndex == 2
                            ? Color(0xff004AC6)
                            : Color(0xffC3C6D7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 7,
                  children: [
                    Text('REDUCE NOISE'),
                    Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        color: Color(0xff737686),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Text('GAIN FOCUS'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            CustomElevatedbutton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.register);
              },
              title: 'Next',
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.asset('assets/Mouse.png'),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          child: Text(
            textAlign: TextAlign.center,
            'Welcome to Task Tracker',
            style: TextTheme.of(context).headlineLarge,
          ),
        ),
        SizedBox(height: 20),
        Text(
          textAlign: TextAlign.center,
          'Organize your tasks and boost productivity with effortless clarity.',
        ),
      ],
    );
  }
}

class Onboardingpagetwo extends StatefulWidget {
  const Onboardingpagetwo({super.key});

  @override
  State<Onboardingpagetwo> createState() => _OnboardingpagetwoState();
}

class _OnboardingpagetwoState extends State<Onboardingpagetwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.asset('assets/Mockup of Task Board UI.png'),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          child: Text(
            textAlign: TextAlign.center,
            'Stay Organized',
            style: TextTheme.of(context).headlineLarge,
          ),
        ),
        SizedBox(height: 20),
        Text(
          textAlign: TextAlign.center,
          'Clutter-free tools designed to help you maintain mental focus.',
        ),
      ],
    );
  }
}

class Onboardingthree extends StatefulWidget {
  const Onboardingthree({super.key});

  @override
  State<Onboardingthree> createState() => _OnboardingthreeState();
}

class _OnboardingthreeState extends State<Onboardingthree> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.asset('assets/bc.png'),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          child: Text(
            textAlign: TextAlign.center,
            'Take Control of Your Day',
            style: TextTheme.of(context).headlineLarge,
          ),
        ),
        SizedBox(height: 20),
        Text(
          textAlign: TextAlign.center,
          'Streamline your mental load with task prioritization .',
        ),
      ],
    );
  }
}
