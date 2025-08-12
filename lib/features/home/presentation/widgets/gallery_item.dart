import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GalleryItem extends StatelessWidget {
  const GalleryItem({
    super.key,
    required this.imageUrl,
    required this.imageHeight,
    required this.index,
  });
  final String imageUrl;
  final double imageHeight;
  final int index;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 100 + index * 100),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 30),
            child: child,
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: imageHeight,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              Container(height: imageHeight, color: Colors.grey[300]),
          errorWidget: (context, url, error) => Container(
            height: imageHeight,
            color: Colors.grey[400],
            child: Icon(Icons.broken_image, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
