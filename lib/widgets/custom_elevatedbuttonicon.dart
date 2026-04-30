import 'package:flutter/material.dart';

class Customelevatedbuttonicon extends StatefulWidget {
  const Customelevatedbuttonicon({
    super.key,
    required this.icon,
    required this.color,
    this.iconAlignment = IconAlignment.start,
  });

  final IconData icon;
  final Color color;
  final IconAlignment iconAlignment;

  @override
  State<Customelevatedbuttonicon> createState() =>
      _CustomelevatedbuttoniconState();
}

class _CustomelevatedbuttoniconState extends State<Customelevatedbuttonicon> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      iconAlignment: widget.iconAlignment,
      icon: Icon(widget.icon, color: Color(0xffffffff)),
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: widget.color),
      label: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Text(
            'Save Task',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight(600),
              color: Color(0xffffffff),
            ),
          ),
        ],
      ),
    );
  }
}
