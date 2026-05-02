import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.color,
    this.padding,
    this.borderRadius,
    this.border,
  });

  final Widget child;
  final dynamic border;
  final Color? color;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? EdgeInsets.all(24),

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // shadow color
            spreadRadius: 1, // kitna phailay
            blurRadius: 2, // softness (jitna zyada utni blur)
            offset: Offset(0, 1),
          ),
        ],
        border: widget.border,
        color: widget.color ?? Color(0xffffffff),
        borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
      ),
      child: widget.child,
    );
  }
}
