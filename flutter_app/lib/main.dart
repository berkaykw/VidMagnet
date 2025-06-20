import 'package:flutter/material.dart';
import 'screens/video_downloader_screen.dart';

void main() {
  runApp(VidMagnetApp());
}

class VidMagnetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VidMagnet',
      debugShowCheckedModeBanner: false,
      home: VideoDownloaderScreen(),
    );
  }
}
