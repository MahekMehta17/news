import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenPhoto extends StatelessWidget {
  const FullScreenPhoto({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: PhotoView(imageProvider: NetworkImage(url)),
      ),
    );
  }
}
