// lib/widgets/home/recording_area.dart

import 'package:flutter/material.dart';
import 'package:screen_recording/controller.dart/recording_controller.dart';
import 'package:screen_recording/theme/app_color.dart';

// Displays timer & status
class RecordingArea extends StatelessWidget {
  final RecordingController controller;
  const RecordingArea({super.key, required this.controller});

  String _getStatusText() {
    if (controller.isRecording) {
      return controller.isPaused ? 'Paused' : 'Recording...';
    }
    return 'Ready to Record';
  }

  @override
  Widget build(BuildContext context) {
    final bool isRec = controller.isRecording;

    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isRec ? AppColors.red : AppColors.grey, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated icon
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 60,
            height: 60,
            decoration: BoxDecoration(color: isRec ? AppColors.red : AppColors.grey, shape: BoxShape.circle),
            child: Icon(isRec ? Icons.fiber_manual_record : Icons.videocam, color: AppColors.white),
          ),
          const SizedBox(height: 20),
          
          // Timer
          Text(controller.recordingTime, style: const TextStyle(color: AppColors.white, fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          // Status
          Text(_getStatusText(), style: const TextStyle(color: AppColors.grey, fontSize: 16)),
        ],
      ),
    );
  }
}