import 'package:flutter/material.dart';

class CustomElevatedbutton extends StatefulWidget {
  const CustomElevatedbutton({
    super.key,
    required this.title,
    required this.width,
    this.fontsize = 20,
  });

  final String title;
  final double width;
  final double fontsize;

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
            fontSize: widget.fontsize,
            fontWeight: FontWeight(700),
          ),
        ),
      ),
    );
  }
}
