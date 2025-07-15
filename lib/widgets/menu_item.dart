import 'package:flutter/material.dart';
import 'package:screen_recording/theme/app_color.dart';

class MenuItemPage extends StatelessWidget {
  const MenuItemPage({
    super.key,
    required this.text,
    required this.onTap,
    this.isDelete = false,
  });

  final String text;
  final VoidCallback onTap;
  final bool isDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            text,
            style: TextStyle(
              color: isDelete ? AppColors.red : AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.white,
            ),
          ),
          onTap: onTap,
        ),
        Divider(height: 1, color: AppColors.grey),
      ],
    );
  }
}
