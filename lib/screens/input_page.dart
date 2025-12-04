import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/page_bloc.dart';
import '../../bloc/page_event.dart';
import 'render_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late final TextEditingController _controller;

  static const String _sampleJson = '''
{
  "page": {
    "components": [
      {
        "type": "text",
        "value": "Welcome to AppDrop Dynamic UI",
        "size": 22,
        "weight": "bold",
        "align": "center",
        "padding": 8
      },
      {
        "type": "banner",
        "image": "https://picsum.photos/800/300",
        "height": 150,
        "padding": 16,
        "radius": 16
      },
      {
        "type": "carousel",
        "images": [
          "https://picsum.photos/800/300?1",
          "https://picsum.photos/800/300?2",
          "https://picsum.photos/800/300?3"
        ],
        "height": 200,
        "autoPlay": true,
        "padding": 12
      },
      {
        "type": "grid",
        "images": [
          "https://picsum.photos/200/200?1",
          "https://picsum.photos/200/200?2",
          "https://picsum.photos/200/200?3",
          "https://picsum.photos/200/200?4"
        ],
        "columns": 2,
        "spacing": 10,
        "padding": 16
      },
      {
        "type": "video",
        "url": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
        "autoPlay": false,
        "loop": false,
        "height": 200,
        "padding": 16,
        "radius": 12
      }
    ]
  }
}
''';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _sampleJson);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: const Text("JSON to UI Engine"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter Page JSON",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: TextField(
                  controller: _controller,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),
                    hintText: "Paste JSON here...",
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    context.read<PageBloc>()
                        .add(LoadPageFromJson(_controller.text));
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const RenderedPage(),
                      ),
                    );
                  },
                  child: const Text("Generate UI"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
