import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 25, right: 25),
      child: Image.asset('assets/images/logo.png', width: 70),
    );
  }
}
