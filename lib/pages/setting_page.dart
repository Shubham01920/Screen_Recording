import 'package:flutter/material.dart';
import 'package:screen_recording/theme/app_color.dart';
import 'package:screen_recording/widgets/menu_item.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              // Top Back Button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const SizedBox(height: 10),

              // Profile Info
              const CircleAvatar(
                radius: 48,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 12),
              const Text(
                "Jerry Johnson",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "jerryrock3022@gmail.com",
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 30),

              // Menu Items
              MenuItemPage(text: "Terms of Use", onTap: () {}),
              MenuItemPage(text: "Privacy Policy", onTap: () {}),
              MenuItemPage(text: "Help/Support", onTap: () {}),
              SizedBox(height: 20,),
              MenuItemPage(text: "Sign Out", onTap: () {}),
              MenuItemPage(text: "Delete Account", onTap: () {}, isDelete: true),

              const Spacer(),

           
            ],
          ),
        ),
      ),
    );
  }
}
