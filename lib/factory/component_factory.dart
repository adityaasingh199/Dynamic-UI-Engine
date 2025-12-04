import 'package:flutter/material.dart';

import '../model/component_model.dart';
import '../widgets/banner_widget.dart';
import '../widgets/carousel_widget.dart';
import '../widgets/grid_widget.dart';
import '../widgets/text_widget.dart';
import '../widgets/video_widget.dart';



class ComponentFactory {
  static Widget build(ComponentModel model) {
    switch (model.type) {
      case 'banner':
        return BannerWidget(config: model.data);
      case 'carousel':
        return CarouselWidget(config: model.data);
      case 'grid':
        return GridWidget(config: model.data);
      case 'video':
        return VideoWidget(config: model.data);
      case 'text':
        return TextBlockWidget(config: model.data);
      default:
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "Unsupported component type: ${model.type}",
            style: const TextStyle(color: Colors.red),
          ),
        );
    }
  }
}
