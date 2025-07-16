// lib/widgets/common/page_indicator_dot.dart
import 'package:flutter/material.dart';
import 'package:screen_recording/theme/app_color.dart';

// Animated dot for page indicators
class PageIndicatorDot extends StatelessWidget {
  final bool isActive;
  const PageIndicatorDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: isActive ? 24.0 : 8.0,
      height: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: isActive ? AppColors.purple : AppColors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}