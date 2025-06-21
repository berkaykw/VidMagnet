import 'package:flutter/material.dart';

class TextField_URL extends StatelessWidget {
  final TextEditingController controller;
  const TextField_URL({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.only(top: 20, left: 5, right: 5),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: controller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: () {
                    controller.clear();
                  }, icon: Icon(Icons.close,color: Colors.white70,)),
                  labelText: "Video URL",
                  labelStyle: TextStyle(
                    color: Colors.white54,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                  ),
                  filled: true,
                  fillColor: Colors.white12,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurple[900]!,
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            );
  }
}