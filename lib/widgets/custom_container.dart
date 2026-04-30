import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.color,
    this.padding,
    this.borderRadius,
  });

  final Widget child;

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
        color: widget.color ?? Color(0xffffffff),
        borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
      ),
      child: widget.child,
    );
  }
}
