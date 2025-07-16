// lib/widgets/home/control_buttons.dart

import 'package:flutter/material.dart';
import 'package:screen_recording/controller.dart/recording_controller.dart';
import 'package:screen_recording/theme/app_color.dart';

// Main action buttons
class ControlButtons extends StatelessWidget {
  final RecordingController controller;
  const ControlButtons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Start/Stop
        _buildControlButton(
          icon: controller.isRecording ? Icons.stop : Icons.play_arrow,
          color: controller.isRecording ? AppColors.red : AppColors.purple,
          onPressed: () => controller.isRecording
              ? controller.stopRecording(context)
              : controller.startRecording(context),
        ),
        // Pause/Resume
        _buildControlButton(
          icon: controller.isPaused ? Icons.play_arrow : Icons.pause,
          color: AppColors.purple,
          onPressed: controller.isRecording
              ? () => controller.pauseResumeRecording(context)
              : null,
        ),
        // Download
        _buildControlButton(
          icon: Icons.download,
          color: AppColors.purple,
          onPressed: controller.recordingPath != null
              ? () => controller.saveToDownloads(context)
              : null,
        ),
      ],
    );
  }

  // Button helper
  Widget _buildControlButton({required IconData icon, required Color color, VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: onPressed != null ? color : AppColors.grey.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.white, size: 30),
      ),
    );
  }
}