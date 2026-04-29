import 'package:flutter/material.dart';

class CustomTextfromfield extends StatefulWidget {
  const CustomTextfromfield({
    super.key,
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String title;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  State<CustomTextfromfield> createState() => _CustomTextfromfieldState();
}

class _CustomTextfromfieldState extends State<CustomTextfromfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        labelText: widget.title,
        filled: true,
        fillColor: Color(0xffF3F3FE),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xffF3F3FE)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xffF3F3FE)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xffF3F3FE)),
        ),
      ),
    );
  }
}
