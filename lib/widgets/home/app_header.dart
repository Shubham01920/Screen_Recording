// lib/widgets/home/app_header.dart

import 'package:flutter/material.dart';
import 'package:screen_recording/pages/setting_page.dart';
import 'package:screen_recording/theme/app_color.dart';

// Header for the home screen
class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // App Title
        const Text(
          'Screen Recorder',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Settings Icon Button
        IconButton(
          icon: const Icon(
            Icons.settings_outlined,
            color: AppColors.grey,
            size: 28,
          ),
          onPressed: () {
            // Navigate to the settings page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            );
          },
        ),
      ],
    );
  }
}