import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/page_bloc.dart';
import '../../bloc/page_state.dart';
import '../../factory/component_factory.dart';

class RenderedPage extends StatelessWidget{
  const RenderedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text("Rendered Page"),
      ),
      body: BlocBuilder<PageBloc, PageState>(
        builder: (context, state) {
          if (state is PageLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PageError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          if (state is PageLoaded) {
            if (state.components.isEmpty) {
              return const Center(
                child: Text("No components found in JSON"),
              );
            }
            return ListView.builder(
              itemCount: state.components.length,
              itemBuilder: (_, index) =>
                  ComponentFactory.build(state.components[index]),
            );
          }
          return const Center(
            child: Text("Please enter JSON on previous screen."),
          );
        },
      ),
    );
  }
}
