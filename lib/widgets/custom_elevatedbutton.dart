import 'package:flutter/material.dart';

class CustomElevatedbutton extends StatefulWidget {
  const CustomElevatedbutton({
    super.key,
    required this.title,
    required this.width,
  });

  final String title;
  final double width;

  @override
  State<CustomElevatedbutton> createState() => _CustomElevatedbuttonState();
}

class _CustomElevatedbuttonState extends State<CustomElevatedbutton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xff004AC6)),
        child: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight(700),
          ),
        ),
      ),
    );
  }
}
