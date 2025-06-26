import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/VideoDownloaderScreen_widgets/body_headerText.dart';
import 'package:flutter_app/widgets/VideoDownloaderScreen_widgets/customButton.dart';
import 'package:flutter_app/widgets/VideoDownloaderScreen_widgets/headerTextRich.dart';
import 'package:flutter_app/widgets/VideoDownloaderScreen_widgets/logo_headerText.dart';
import 'package:flutter_app/widgets/VideoDownloaderScreen_widgets/selectFormat.dart';
import 'package:flutter_app/widgets/VideoDownloaderScreen_widgets/textField_url.dart';
import 'package:flutter_app/widgets/VideoDownloaderScreen_widgets/video_info_card.dart';
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
  bool _showCard = false;
  String _videoTitle = '';
  String _videoThumbnail = '';
  int? _videoSize;
  int? _videoDuration;

  Future<void> sendVideoUrls() async {
    //final url = Uri.parse('http://10.0.2.2:8000/download');
    final url = Uri.parse('http://127.0.0.1:8000/download');
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

  Future<void> fetchVideoInfo() async {
    //final url = Uri.parse('http://10.0.2.2:8000/info');
    final url = Uri.parse('http://127.0.0.1:8000/info');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "url_list": [_controller.text],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _videoTitle = data['title'] ?? "Unknown Title";
        _videoThumbnail = data['thumbnail'] ?? "";
        _videoSize = data['filesize'];
        _videoDuration = data['duration'];
        _showCard = true;
      });
    } else {
      setState(() {
        _status = "Failed to fetch video information.";
        _showCard = false;
      });
    }
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              LogoImage(),
              LogoHeaderText(),
              HeaderText(),
              SizedBox(height: 50),
              BodyHeaderText(text: "Enter Video URL"),
              TextField_URL(controller: _controller),
              SizedBox(height: 25),
              BodyHeaderText(text: "Select Format"),
              SizedBox(height: 20),
              SelectFormat(
                audioOnly: _audioOnly,
                onChanged: (bool val) {
                  setState(() {
                    _audioOnly = val;
                  });
                },
              ),
              SizedBox(height: 15),
              if (_showCard)
                VideoInfoCard(
                  thumbnailUrl: _videoThumbnail,
                  title: _videoTitle,
                  fileSize: _videoSize,
                  durationSeconds: _videoDuration,
                ),
              Custom_Button(
                button_text: "Download",
                loading_text: "Downloading...",
                button_color: Colors.deepPurple[900]!,
                text_color: Colors.white,
                onPressed: () async {
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
                        margin: EdgeInsets.only(
                          bottom: 25,
                          left: 10,
                          right: 10,
                        ),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    return; // durdur
                  }
                  await fetchVideoInfo();
                  await sendVideoUrls();
                },
                onCancel: () {},
                width: 0.895,
                height: 0.07,
                font_size: 24,
                font_weight: FontWeight.w800,
                font_family: 'Manrope',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
