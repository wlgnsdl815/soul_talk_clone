import 'dart:io';
import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final String imagePath; // 이미지 경로
  final BoxFit? fit; // 이미지 fit

  const ImageLoader({
    super.key,
    required this.imagePath,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
      return Image.network(
        imagePath,
        fit: fit ?? BoxFit.cover,
      );
    } else {
      return Image.file(
        File(imagePath),
        fit: fit ?? BoxFit.cover,
      );
    }
  }
}
