import 'package:flutter/material.dart';

class SelectFormat extends StatelessWidget {
  final bool audioOnly;
  final void Function(bool) onChanged;

  const SelectFormat({super.key, required this.audioOnly, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(false),
            child: Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: !audioOnly ? Colors.deepPurple[600] : Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.deepPurple),
                ),
                child: Center(
                  child: Text(
                    "Video (.mp4)",
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      color: !audioOnly ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(true),
            child: Padding(
              padding: EdgeInsets.only(right: 50.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: audioOnly ? Colors.deepPurple[600] : Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.deepPurple),
                ),
                child: Center(
                  child: Text(
                    "Audio (.mp3)",
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      color: audioOnly ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
