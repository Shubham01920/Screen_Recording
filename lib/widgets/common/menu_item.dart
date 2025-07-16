// lib/widgets/common/menu_item.dart
import 'package:flutter/material.dart';
import 'package:screen_recording/theme/app_color.dart';

// A navigable list tile item
class MenuItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isDelete;

  const MenuItem({
    super.key,
    required this.text,
    required this.onTap,
    this.isDelete = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(text, style: TextStyle(color: isDelete ? AppColors.red : AppColors.white, fontSize: 16)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.white),
          onTap: onTap,
        ),
        const Divider(height: 1, color: AppColors.grey),
      ],
    );
  }
}