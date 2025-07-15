import 'package:flutter/material.dart';
import 'package:screen_recording/theme/app_color.dart';
import 'package:screen_recording/widgets/build_header.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              BuildHeader(),
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
