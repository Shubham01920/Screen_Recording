import 'package:flutter/material.dart';
import 'package:screen_recording/pages/setting_page.dart';
import 'package:screen_recording/theme/app_color.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Screen Recorder",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),

        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingPage()),
            );
          },
          icon: Icon(Icons.settings, color: AppColors.grey, size: 24),
        ),
      ],
    );
  }
}
