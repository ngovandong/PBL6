import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final double width;
  final double height;
  final List<String> images;

  const ImageSlider({
    super.key,
    required this.height,
    this.width = double.infinity,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: PageView.builder(
        itemCount: images.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              images[index],
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
