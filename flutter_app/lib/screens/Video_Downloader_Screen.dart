import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VideoDownloaderScreen extends StatefulWidget {
  @override
  _VideoDownloaderScreenState createState() => _VideoDownloaderScreenState();
}

class _VideoDownloaderScreenState extends State<VideoDownloaderScreen> {
  final TextEditingController _controller = TextEditingController();
  String _status = '';

  Future<void> sendVideoUrls() async {
    final url = Uri.parse('http://127.0.0.1:8000/download');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'url_list': [_controller.text]}),
    );

    setState(() {
      if (response.statusCode == 200) {
        _status = 'İndirme başlatıldı!';
      } else {
        _status = 'Hata: ${response.statusCode}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('VidMagnet')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Video URL',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: sendVideoUrls,
              child: Text('İndir'),
            ),
            SizedBox(height: 16),
            Text(_status),
          ],
        ),
      ),
    );
  }
}
