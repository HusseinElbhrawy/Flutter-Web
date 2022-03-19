import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Author',
      style: TextStyle(
        color: Color(0xFF077bd7),
        fontSize: 26,
        fontFamily: ' Raleway',
        fontWeight: FontWeight.w900,
        letterSpacing: 3,
      ),
    );
  }
}
