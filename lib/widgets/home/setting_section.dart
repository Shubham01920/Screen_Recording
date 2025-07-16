// lib/widgets/home/settings_section.dart

import 'package:flutter/material.dart';
import 'package:screen_recording/controller.dart/recording_controller.dart';
import 'package:screen_recording/model/setting_model.dart';
import 'package:screen_recording/widgets/setting/reusable_setting_item.dart';
import 'package:screen_recording/widgets/setting/setting_bottom_sheet.dart';

// List of settings on home screen
class SettingsSection extends StatelessWidget {
  final RecordingController controller;
  const SettingsSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = !controller.isRecording;

    // Disable settings while recording
    return IgnorePointer(
      ignoring: !isEnabled,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isEnabled ? 1.0 : 0.5,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quality
              SelectableSettingItem(
                title: 'Video Quality',
                currentValue: controller.settings.videoQuality.displayName,
                leadingIcon: Icons.high_quality,
                options: SettingOptions.videoQualityOptions(),
                onChanged: (val) => controller.updateSettings(
                  controller.settings.copyWith(videoQuality: VideoQuality.values.firstWhere((q) => q.resolution == val))),
              ),
              // Audio
              SelectableSettingItem(
                title: 'Audio Source',
                currentValue: controller.settings.audioOption.title,
                leadingIcon: Icons.audiotrack,
                options: SettingOptions.audioOptions(),
                onChanged: (val) => controller.updateSettings(
                  controller.settings.copyWith(audioOption: AudioOption.values.firstWhere((a) => a.title == val))),
              ),
              // Format
              SelectableSettingItem(
                title: 'Output Format',
                currentValue: controller.settings.outputFormat.displayName,
                leadingIcon: Icons.video_file,
                options: SettingOptions.outputFormatOptions(),
                onChanged: (val) => controller.updateSettings(
                  controller.settings.copyWith(outputFormat: OutputFormat.values.firstWhere((f) => f.extension == val))),
              ),
              // Countdown
              ToggleSettingItem(
                title: 'Countdown Timer',
                subtitle: '3-second delay before start',
                leadingIcon: Icons.timer,
                value: controller.settings.enableCountdown,
                onChanged: (val) => controller.updateSettings(
                  controller.settings.copyWith(enableCountdown: val)),
              )
            ],
          ),
        ),
      ),
    );
  }
}