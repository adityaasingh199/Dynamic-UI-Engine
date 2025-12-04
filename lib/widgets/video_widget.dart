import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final Map<String, dynamic> config;

  const VideoWidget({super.key, required this.config});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late final VideoPlayerController _controller;
  bool _initialized = false;

  double get _height => (widget.config['height'] ?? 200).toDouble();
  double get _padding => (widget.config['padding'] ?? 12).toDouble();
  double get _radius => (widget.config['radius'] ?? 12).toDouble();
  bool get _autoPlay => widget.config['autoPlay'] == true;
  bool get _loop => widget.config['loop'] == true;

  @override
  void initState() {
    super.initState();
    final url = widget.config['url'] as String?;
    if (url == null) return;

    _controller = VideoPlayerController.network(url)
      ..setLooping(_loop)
      ..initialize().then((_) {
        if (!mounted) return;
        setState(() => _initialized = true);
        if (_autoPlay) _controller.play();
      });
  }

  @override
  void dispose() {
    if (_initialized) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final url = widget.config['url'] as String?;
    if (url == null) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.all(_padding),
      child: _initialized
          ? SizedBox(
        height: _height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(_radius),
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
            IconButton(
              icon: Icon(
                _controller.value.isPlaying
                    ? Icons.pause_circle
                    : Icons.play_circle,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
            ),
          ],
        ),
      )
          : SizedBox(
        height: _height,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
