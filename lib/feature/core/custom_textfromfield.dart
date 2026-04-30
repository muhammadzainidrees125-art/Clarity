import 'package:flutter/material.dart';

class CustomTextfromfield extends StatefulWidget {
  const CustomTextfromfield({
    super.key,
    this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.maxlines,
    this.isCompulsory = false,
  });

  final String? title;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxlines;
  final bool isCompulsory;

  @override
  State<CustomTextfromfield> createState() => _CustomTextfromfieldState();
}

class _CustomTextfromfieldState extends State<CustomTextfromfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Text(
            '${widget.title ?? ''} ${widget.isCompulsory == true ? '*' : ''}',
          ),
        TextFormField(
          maxLines: widget.maxlines,
          decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
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
        ),
      ],
    );
  }
}
