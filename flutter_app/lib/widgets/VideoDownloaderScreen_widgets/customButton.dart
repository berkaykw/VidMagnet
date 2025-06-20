import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {

  final String button_text;
  final Color button_color;
  final Color text_color;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double font_size;
  final FontWeight font_weight;
  final String font_family;

  const Custom_Button({
    super.key,
    required this.button_text,
    required this.button_color,
    required this.text_color,
    required this.onPressed,
    required this.height,
    required this.width,
    required this.font_size,
    required this.font_weight,
    required this.font_family,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(button_color),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15,
              ),
              side: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          button_text,
          style: TextStyle(color: text_color,fontSize: font_size,fontWeight: font_weight,fontFamily: font_family),
        ),
      ),
    );
  }
}