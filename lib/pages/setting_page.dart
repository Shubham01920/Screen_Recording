// lib/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:screen_recording/pages/legal/help_support_page.dart';
import 'package:screen_recording/pages/legal/privacy_page.dart';
import 'package:screen_recording/pages/legal/terms_condition.dart';
import 'package:screen_recording/theme/app_color.dart';
import 'package:screen_recording/widgets/common/back_header.dart';
import 'package:screen_recording/widgets/common/menu_item.dart';

// Settings & Legal Info Screen
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              const BackHeader(title: "Settings"),
              MenuItem(text: "Terms & Conditions", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TermsConditionPage()))),
              MenuItem(text: "Privacy Policy", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PrivacyPolicyPage()))),
              MenuItem(text: "Help & Support", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpSupportPage()))),
            ],
          ),
        ),
      ),
    );
  }
}