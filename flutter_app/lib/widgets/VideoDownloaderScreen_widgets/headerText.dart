import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100, left: 25, right: 25),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Download",
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 38,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(
              text: "  ",
            ),
            TextSpan(
              text: "Video",
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 38,
                color: Colors.deepPurple[900],
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
