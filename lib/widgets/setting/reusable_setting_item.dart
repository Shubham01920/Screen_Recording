// lib/widgets/settings/reusable_setting_item.dart

import 'package:flutter/material.dart';
import 'package:screen_recording/theme/app_color.dart';
import 'package:screen_recording/widgets/setting/setting_bottom_sheet.dart';

// Base UI for a setting row
class ReusableSettingItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? leadingIcon;
  final Widget? trailing;
  final VoidCallback? onTap;

  const ReusableSettingItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.leadingIcon,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              if (leadingIcon != null) ...[
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: AppColors.purple.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                  child: Icon(leadingIcon, color: AppColors.purple, size: 20),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(color: AppColors.white, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(subtitle, style: const TextStyle(color: AppColors.grey, fontSize: 14)),
                  ],
                ),
              ),
              if (trailing != null)
                trailing!
              else
                const Icon(Icons.arrow_forward_ios, color: AppColors.grey, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// Setting item for selection
class SelectableSettingItem extends StatelessWidget {
  final String title;
  final String currentValue;
  final IconData? leadingIcon;
  final List<SettingOption> options;
  final Function(String) onChanged;

  const SelectableSettingItem({
    super.key,
    required this.title,
    required this.currentValue,
    required this.options,
    required this.onChanged,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ReusableSettingItem(
      title: title,
      subtitle: currentValue,
      leadingIcon: leadingIcon,
      onTap: () => showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (_) => SettingsBottomSheet(
          title: 'Select $title',
          options: options,
          currentValue: currentValue,
          onSelected: onChanged,
        ),
      ),
    );
  }
}

// Setting item with a toggle
class ToggleSettingItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final IconData? leadingIcon;
  final Function(bool) onChanged;

  const ToggleSettingItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ReusableSettingItem(
      title: title,
      subtitle: subtitle,
      leadingIcon: leadingIcon,
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.purple,
      ),
    );
  }
}