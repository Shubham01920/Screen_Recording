import 'package:flutter/material.dart';
import 'package:screen_recording/pages/home_page.dart';
import 'package:screen_recording/screen.dart';
import 'package:screen_recording/theme/app_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen Recorder',
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        primaryColor: AppColors.purple,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Inter', // You can change this later
      ),
      home: ScreenRecorderPage(),
    );
  }
}