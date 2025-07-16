import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:screen_recording/pages/onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'package:screen_recording/auth/login_page.dart';

import 'package:screen_recording/theme/app_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> hasSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_seen') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen Recorder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.purple,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Inter',
      ),
      home: FutureBuilder<bool>(
        future: hasSeenOnboarding(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.data == true) {
            return const LoginPage(); // ✅ Already seen onboarding → show login
          } else {
            return const OnboardingPage(); // ✅ First time → show onboarding
          }
        },
      ),
    );
  }
}
