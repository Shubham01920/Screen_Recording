// lib/screens/settings_screen.dart

import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:screen_recording/auth/login_page.dart';
import 'package:screen_recording/pages/legal/help_support_page.dart';
import 'package:screen_recording/pages/legal/privacy_page.dart';
import 'package:screen_recording/pages/legal/terms_condition.dart';
import 'package:screen_recording/theme/app_color.dart';
import 'package:screen_recording/widgets/common/menu_item.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  File? _image;
  Uint8List? _webImage;

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null) {
      if (kIsWeb) {
        setState(() {
          _webImage = result.files.first.bytes;
        });
      } else {
        final path = result.files.single.path!;
        setState(() {
          _image = File(path);
        });
      }
    }
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  Future<void> _deleteAccount() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
        (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error deleting account: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              // 🔙 Back Button on top-left
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // 🏷 Centered Title
              const Center(
                child: Text(
                  "Settings",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 👤 Avatar Picker
              GestureDetector(
                onTap: _pickImage,
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.grey.withOpacity(0.2),
                    backgroundImage: kIsWeb
                        ? (_webImage != null ? MemoryImage(_webImage!) : null)
                        : (_image != null ? FileImage(_image!) : null)
                              as ImageProvider<Object>?,
                    child: (_webImage == null && _image == null)
                        ? const Icon(
                            Icons.camera_alt,
                            color: AppColors.grey,
                            size: 30,
                          )
                        : null,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ⚖️ Legal Links
              MenuItem(
                text: "Terms & Conditions",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TermsConditionPage()),
                ),
              ),
              MenuItem(
                text: "Privacy Policy",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PrivacyPolicyPage()),
                ),
              ),
              MenuItem(
                text: "Help & Support",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HelpSupportPage()),
                ),
              ),

              const Spacer(),

              // 🔐 Sign Out
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.logout),
                  label: const Text(
                    "Sign Out",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _signOut,
                ),
              ),

              const SizedBox(height: 12),

              // 🗑️ Delete Account
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.delete_forever),
                  label: const Text(
                    "Delete Account",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _deleteAccount,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
