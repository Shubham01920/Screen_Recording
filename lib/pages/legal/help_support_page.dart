import 'package:flutter/material.dart';
import 'package:screen_recording/theme/app_color.dart';
import 'package:screen_recording/widgets/common/back_header.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const BackHeader(title: "Help & Support"),
              Expanded(
                child: SingleChildScrollView(
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        height: 1.6,
                      ),
                      children: const [
                        TextSpan(
                          text: 'Need help using the Screen Recording App?\n\n',
                        ),
                        TextSpan(
                          text: '1. How do I start screen recording?\n',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'To start screen recording, tap the record button on the home screen. Grant required permissions such as screen capture and microphone access when prompted.\n\n',
                        ),
                        TextSpan(
                          text: '2. Where are recordings saved?\n',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'All recordings are saved locally in your device’s storage. You can view or share them from the "My Recordings" section.\n\n',
                        ),
                        TextSpan(
                          text: '3. The app is not recording sound. What should I do?\n',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Ensure microphone permission is granted. Also, check your system settings to make sure audio input is enabled for screen recordings.\n\n',
                        ),
                        TextSpan(
                          text: '4. How do I delete a recording?\n',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Go to the "My Recordings" section, long press the file you want to delete, then tap the delete icon.\n\n',
                        ),
                        TextSpan(
                          text: '5. I found a bug or need technical support.\n',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Please report issues to our support team at support@screenrecorder.com. Include details like your device model and steps to reproduce the issue.\n\n',
                        ),
                        TextSpan(
                          text: '6. How do I update the app?\n',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Check the Google Play Store (or App Store) for updates. We regularly release improvements and bug fixes.\n\n',
                        ),
                        TextSpan(
                          text:
                              'Still have questions? Reach out to us via email, and we’ll be happy to assist you!',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
