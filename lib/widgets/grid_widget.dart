import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  final Map<String, dynamic> config;

  const GridWidget({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final images = config['images'] ?? [];
    final columns = (config['columns'] ?? 2) as int;
    final spacing = (config['spacing'] ?? 8).toDouble();
    final padding = (config['padding'] ?? 16).toDouble();

    if (images.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.all(padding),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
        ),
        itemBuilder: (_, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
