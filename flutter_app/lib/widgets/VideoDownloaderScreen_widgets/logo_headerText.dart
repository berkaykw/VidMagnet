import 'package:flutter/material.dart';

class LogoHeaderText extends StatelessWidget {
  const LogoHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "VidMagnet",
      style: TextStyle(
        fontFamily: "Manrope",
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
