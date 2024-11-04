import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';

class ImageButton extends StatelessWidget {
  final VoidCallback onTap;
  final double width;
  final double height;
  final EdgeInsets padding;
  final String imagePath;

  const ImageButton({
    super.key,
    required this.onTap,
    required this.imagePath,
    this.width = 26,
    this.height = 26,
    this.padding = const EdgeInsets.all(10),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Tap(
        onTap: onTap,
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
