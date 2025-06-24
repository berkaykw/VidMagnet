import 'package:flutter/material.dart';

class VideoInfoCard extends StatelessWidget {
  final String? thumbnailUrl;
  final String title;
  final int? fileSize;         // byte cinsinden dosya boyutu
  final int? durationSeconds;  // video uzunluğu saniye cinsinden

  const VideoInfoCard({
    super.key,
    required this.thumbnailUrl,
    required this.title,
    required this.fileSize,
    this.durationSeconds,
  });

  // Duration saniyeyi "hh:mm:ss" veya "mm:ss" formatına çevirir
  String _formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final secs = twoDigits(duration.inSeconds.remainder(60));

    if (hours > 0) {
      return '$hours:$minutes:$secs';
    } else {
      return '$minutes:$secs';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Card(
        color: Colors.white10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.white12),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: (thumbnailUrl != null && thumbnailUrl!.isNotEmpty)
                    ? Image.network(
                        thumbnailUrl!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 100,
                        height: 100,
                        color: Colors.black26,
                        child: Icon(Icons.image_not_supported,
                            color: Colors.white30, size: 40),
                      ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.isNotEmpty ? title : 'No Title',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      fileSize != null
                          ? "Size: ${(fileSize! / (1024 * 1024)).toStringAsFixed(2)} MB"
                          : "Size: Unknown",
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 13,
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      durationSeconds != null
                          ? "Length: ${_formatDuration(durationSeconds!)}"
                          : "Length: Unknown",
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 13,
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
