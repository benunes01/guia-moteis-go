import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  const CircularImage({
    super.key,
    required this.imageUrl,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
