import 'package:clarity/feature/signup/view/screen/home_screen.dart';
import 'package:clarity/feature/signup/view/screen/setting_screen.dart';
import 'package:flutter/material.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({super.key});

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  List<Widget> screens = [HomeScreen(), Text('data'), SettingScreen()];
  int val = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[val],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0XFF2563EB),
        onTap: (value) {
          setState(() {
            val = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: val == 0 ? Colors.blueAccent : Colors.white54,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_chart_rounded,
              color: val == 1 ? Colors.blueAccent : Colors.white54,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_chart_rounded,
              color: val == 2 ? Colors.blueAccent : Colors.white54,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
