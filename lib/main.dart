import 'package:flutter/material.dart';
import 'package:gs_whiteboard_widgets/utils/sizer.dart';
import 'package:gs_whiteboard_widgets/widgets/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget with WidgetsBindingObserver {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        Sizer.init(context);
        return child!;
      },
      home: const Home(),
    );
  }
}
