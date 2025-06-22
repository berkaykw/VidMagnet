import 'package:flutter/material.dart';

class BodyHeaderText extends StatelessWidget {
  final String text;
  const BodyHeaderText({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
  }
}