// lib/widgets/settings/settings_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:screen_recording/model/setting_model.dart';
import 'package:screen_recording/theme/app_color.dart';

// The main bottom sheet widget
class SettingsBottomSheet extends StatelessWidget {
  final String title;
  final List<SettingOption> options;
  final String currentValue;
  final Function(String) onSelected;

  const SettingsBottomSheet({
    super.key,
    required this.title,
    required this.options,
    required this.currentValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.circular(2)),
          ),
          
          // Title
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(title, style: const TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w600)),
          ),
          
          // Options list
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options[index];
                final isSelected = option.value == currentValue;
                
                return InkWell(
                  onTap: () { onSelected(option.value); Navigator.pop(context); },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Row(
                      children: [
                        if (option.icon != null) ...[
                          Icon(option.icon, color: isSelected ? AppColors.purple : AppColors.grey),
                          const SizedBox(width: 16),
                        ],
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(option.title, style: const TextStyle(color: AppColors.white, fontSize: 16)),
                              if (option.description != null) ...[
                                const SizedBox(height: 4),
                                Text(option.description!, style: const TextStyle(color: AppColors.grey, fontSize: 14)),
                              ],
                            ],
                          ),
                        ),
                        if (isSelected) const Icon(Icons.check_circle, color: AppColors.purple),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// Model for a single choice
class SettingOption {
  final String title;
  final String value;
  final String? description;
  final IconData? icon;

  const SettingOption({
    required this.title,
    required this.value,
    this.description,
    this.icon,
  });
}

// Helper to generate lists of options
class SettingOptions {
  static List<SettingOption> videoQualityOptions() {
    return VideoQuality.values.map((q) => SettingOption(
      title: q.displayName,
      value: q.resolution,
      icon: Icons.high_quality,
    )).toList();
  }

  static List<SettingOption> outputFormatOptions() {
    return OutputFormat.values.map((f) => SettingOption(
      title: f.displayName,
      value: f.extension,
      icon: Icons.video_file,
    )).toList();
  }

  static List<SettingOption> audioOptions() {
    return AudioOption.values.map((a) => SettingOption(
      title: a.title,
      value: a.title,
      description: a.description,
      icon: _getAudioIcon(a),
    )).toList();
  }

  static IconData _getAudioIcon(AudioOption audio) {
    switch (audio) {
      case AudioOption.systemOnly: return Icons.volume_up;
      case AudioOption.micOnly: return Icons.mic;
      case AudioOption.both: return Icons.multitrack_audio;
      case AudioOption.none: return Icons.volume_off;
    }
  }
}