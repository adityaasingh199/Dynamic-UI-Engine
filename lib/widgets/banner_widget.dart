import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final Map<String, dynamic> config;

  const BannerWidget({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final image = config['image'] as String?;
    final height = (config['height'] ?? 180).toDouble();
    final padding = (config['padding'] ?? 16).toDouble();
    final radius = (config['radius'] ?? 12).toDouble();

    if (image == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.all(padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.network(
          image,
          height: height,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
