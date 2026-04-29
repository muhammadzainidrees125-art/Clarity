import 'package:flutter/material.dart';

class Customelevatedbuttonicon extends StatefulWidget {
  const Customelevatedbuttonicon({
    super.key,
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  @override
  State<Customelevatedbuttonicon> createState() =>
      _CustomelevatedbuttoniconState();
}

class _CustomelevatedbuttoniconState extends State<Customelevatedbuttonicon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: widget.color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight(600),
                color: Color(0xffffffff),
              ),
            ),
            Icon(widget.icon, color: Color(0xffffffff)),
          ],
        ),
      ),
    );
  }
}
