import 'package:flutter/material.dart';

class TextBlockWidget extends StatelessWidget {
  final Map<String, dynamic> config;

  const TextBlockWidget({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final value = config['value']?.toString() ?? '';
    final size = (config['size'] ?? 16).toDouble();
    final padding = (config['padding'] ?? 16).toDouble();
    final weightString = config['weight']?.toString();
    final alignString = config['align']?.toString();

    final fontWeight =
    weightString == 'bold' ? FontWeight.bold : FontWeight.normal;

    final textAlign = switch (alignString) {
      'center' => TextAlign.center,
      'right' => TextAlign.right,
      _ => TextAlign.left,
    };

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(
        value,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
