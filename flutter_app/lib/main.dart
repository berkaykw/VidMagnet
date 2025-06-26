import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/VideoDownloaderScreen_widgets/splash_screen.dart';

void main() {
  runApp(VidMagnetApp());
}

class VidMagnetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VidMagnet',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
