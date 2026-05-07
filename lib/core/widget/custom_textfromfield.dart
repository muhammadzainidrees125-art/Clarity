import 'package:flutter/material.dart';

class CustomTextfromfield extends StatefulWidget {
  const CustomTextfromfield({
    super.key,
    this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.maxlines,
    this.isCompulsory = false,
    this.obscureText = false,
    this.onSuffixIconPressed,
    required this.controller,
  });

  final String? title;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxlines;
  final bool isCompulsory;
  final bool obscureText;
  final VoidCallback? onSuffixIconPressed;
  final TextEditingController controller;

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
          controller: widget.controller,
          maxLines: widget.obscureText ? 1 : widget.maxlines,
          minLines: 1,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            suffixIcon: widget.onSuffixIconPressed != null
                ? GestureDetector(
                    onTap: widget.onSuffixIconPressed,
                    child: widget.suffixIcon,
                  )
                : widget.suffixIcon,
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
