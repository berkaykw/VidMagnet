import 'package:flutter/material.dart';

class Custom_Button extends StatefulWidget {
  final String button_text;
  final String loading_text;
  final Color button_color;
  final Color text_color;
  final Future<void> Function() onPressed;
  final double width;
  final double height;
  final double font_size;
  final FontWeight font_weight;
  final String font_family;

  // opsiyonel iptal callback
  final VoidCallback? onCancel;

  const Custom_Button({
    super.key,
    required this.button_text,
    this.loading_text = "Loading...",
    required this.button_color,
    required this.text_color,
    required this.onPressed,
    required this.height,
    required this.width,
    required this.font_size,
    required this.font_weight,
    required this.font_family,
    this.onCancel,
  });

  @override
  State<Custom_Button> createState() => _Custom_ButtonState();
}

class _Custom_ButtonState extends State<Custom_Button> {
  bool _isLoading = false;

  void _handlePress() async {
    if (_isLoading) {
      // İkinci tıklamada loading'i iptal et
      setState(() {
        _isLoading = false;
      });
      if (widget.onCancel != null) widget.onCancel!();
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      if (mounted && _isLoading) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * widget.width,
      height: MediaQuery.of(context).size.height * widget.height,
      child: ElevatedButton(
        onPressed: _handlePress,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.button_color,
          disabledBackgroundColor: widget.button_color,
          foregroundColor: widget.text_color,
          disabledForegroundColor: widget.text_color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.black, width: 2),
          ),
        ),
        child: _isLoading
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: widget.font_size * 0.8,
                    height: widget.font_size * 0.8,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(widget.text_color),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.loading_text,
                    style: TextStyle(
                      color: widget.text_color,
                      fontSize: widget.font_size,
                      fontWeight: widget.font_weight,
                      fontFamily: widget.font_family,
                    ),
                  ),
                ],
              )
            : Text(
                widget.button_text,
                style: TextStyle(
                  color: widget.text_color,
                  fontSize: widget.font_size,
                  fontWeight: widget.font_weight,
                  fontFamily: widget.font_family,
                ),
              ),
      ),
    );
  }
}
