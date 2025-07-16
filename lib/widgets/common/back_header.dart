// lib/widgets/common/back_header.dart
import 'package:flutter/material.dart';

// Header with back arrow & title
class BackHeader extends StatelessWidget {
  final String title;
  const BackHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 20),
      ],
    );
  }
}