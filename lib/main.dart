import 'package:appdrop_dynamic_ui/screens/input_page.dart';
import 'package:appdrop_dynamic_ui/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/page_bloc.dart';


void main() {
  runApp(const DynamicUiApp());
}

class DynamicUiApp extends StatelessWidget {
  const DynamicUiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PageBloc(),
      child: MaterialApp(
        title: 'AppDrop Dynamic UI',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        home: const InputPage(),
      ),
    );
  }
}
