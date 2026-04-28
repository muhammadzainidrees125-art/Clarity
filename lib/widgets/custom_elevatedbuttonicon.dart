import 'package:flutter/material.dart';

class Customelevatedbuttonicon extends StatefulWidget {
  const Customelevatedbuttonicon({super.key});

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
        child: Row(
          spacing: 10,
          children: [
            Icon(Icons.account_circle_outlined, color: Color(0xff191B23)),
            Text(
              'Sign up with Google',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight(600),
                color: Color(0xff191B23),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
