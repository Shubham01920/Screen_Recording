import 'package:flutter/material.dart';
import 'package:screen_recording/theme/app_color.dart';
import 'package:screen_recording/widgets/common/back_header.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

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
              const BackHeader(title: "Privacy Policy"),
          
              // Content Section
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
                          text:
                              'Your privacy is important to us. This privacy policy explains how we handle your data while using our Screen Recording App.\n\n',
                        ),
                        TextSpan(
                          text: '1. Data Collection\n',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'We do not collect, store, or share any personal data. All screen recordings are stored locally on your device.\n\n',
                        ),
                        TextSpan(
                          text: '2. Permissions\n',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'To enable screen recording functionality, we may request access to your device’s microphone, screen, and storage. These permissions are only used to provide core features of the app.\n\n',
                        ),
                        TextSpan(
                          text: '3. No Third-Party Sharing\n',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'We do not share your data with third-party services. Everything recorded remains within your control.\n\n',
                        ),
                        TextSpan(
                          text: '4. Children’s Privacy\n',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Our app is not intended for children under the age of 13. We do not knowingly collect data from minors.\n\n',
                        ),
                        TextSpan(
                          text: '5. Updates to Policy\n',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'We may update this policy from time to time. Continued use of the app means you agree to the updated policy.\n\n',
                        ),
                        TextSpan(
                          text: '6. Contact Us\n',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'If you have any questions or concerns about your privacy, feel free to contact us at support@screenrecorder.com.\n\n',
                        ),
                        TextSpan(
                          text:
                              'By using this app, you agree to the terms outlined in this Privacy Policy.',
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
