import 'dart:async';

import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  final Map<String, dynamic> config;

  const CarouselWidget({super.key, required this.config});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late final PageController _controller;
  Timer? _timer;

  List get _images => widget.config['images'] ?? [];
  double get _height => (widget.config['height'] ?? 220).toDouble();
  double get _padding => (widget.config['padding'] ?? 12).toDouble();
  bool get _autoPlay => widget.config['autoPlay'] == true;

  @override
  void initState() {
    super.initState();
    _controller = PageController();

    if (_autoPlay && _images.length > 1) {
      _timer = Timer.periodic(const Duration(seconds: 3), (_) {
        if (!_controller.hasClients) return;
        final next = (_controller.page?.round() ?? 0) + 1;
        final index = next % _images.length;
        _controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_images.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.all(_padding),
      child: SizedBox(
        height: _height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: PageView.builder(
            controller: _controller,
            itemCount: _images.length,
            itemBuilder: (_, i) => Image.network(
              _images[i],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
