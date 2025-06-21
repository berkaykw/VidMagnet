import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/VideoDownloaderScreen_widgets/customButton.dart';
import 'package:flutter_app/widgets/VideoDownloaderScreen_widgets/headerText.dart';
import 'package:flutter_app/widgets/VideoDownloaderScreen_widgets/logo_headerText.dart';
import 'package:flutter_app/widgets/VideoDownloaderScreen_widgets/textField_url.dart';
import 'package:flutter_app/widgets/image_logo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VideoDownloaderScreen extends StatefulWidget {
  @override
  _VideoDownloaderScreenState createState() => _VideoDownloaderScreenState();
}

class _VideoDownloaderScreenState extends State<VideoDownloaderScreen> {
  final TextEditingController _controller = TextEditingController();
  String _status = '';
  bool _audioOnly = false;

  Future<void> sendVideoUrls() async {
    if (_controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please enter a video URL.',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.only(bottom: 25, left: 10, right: 10),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return; // durdur
    }
   final url = Uri.parse('http://10.0.2.2:8000/download');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'url_list': [_controller.text],
        'audio_only': _audioOnly,
      }),
    );

    setState(() {
      if (response.statusCode == 200) {
        _status = 'Download Completed!';
      } else {
        _status = 'Hata: ${response.statusCode}';
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _status,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor:
            response.statusCode == 200
                ? Colors.greenAccent[400]
                : Colors.redAccent,
        duration: Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(bottom: 25, left: 10, right: 10),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              LogoImage(),
              LogoHeaderText(),
              HeaderText(),
              TextField_URL(controller: _controller),
              SizedBox(height: 25),
              Custom_Button(
                button_text: "Download",
                button_color: Colors.deepPurple[900]!,
                text_color: Colors.white,
                onPressed: sendVideoUrls,
                width: 0.895,
                height: 0.07,
                font_size: 24,
                font_weight: FontWeight.w800,
                font_family: 'Manrope',
              ),
              SizedBox(height: 16),
              Custom_Button(
                button_text: "Clear",
                button_color: Colors.white,
                text_color: Colors.black,
                onPressed: () {
                  _controller.clear();
                },
                width: 0.5,
                height: 0.06,
                font_size: 24,
                font_weight: FontWeight.w800,
                font_family: 'Manrope',
              ),
              CheckboxListTile(
  title: Text('Ses olarak indir'),
  value: _audioOnly,
  onChanged: (bool? value) {
    setState(() {
      _audioOnly = value ?? false;
    });
  },
),
            ],
          ),
        ),
      ),
    );
  }
}
