import 'package:flutter/material.dart';
import 'package:screen_recording/theme/app_color.dart';
import 'package:screen_recording/widgets/common/back_header.dart';

class TermsConditionPage extends StatelessWidget {
  const TermsConditionPage({super.key});

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
            BackHeader(title: "Terms & Condition"),

              // Terms content
              Expanded(
                child: SingleChildScrollView(
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        color: Colors.white,
                        height: 1.6,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Welcome to our Screen Recording App!\n\n',
                          style: TextStyle(fontSize: 18),
                        ),
                        const TextSpan(
                          text:
                              'Please read these Terms and Conditions carefully before using the app. By using the app, you agree to be bound by these terms.\n\n',
                          style: TextStyle(fontSize: 18),
                        ),

                        // 1. Usage
                        TextSpan(
                          text: '1. Usage\n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              'You agree to use this app only for lawful purposes. You must not use the app in a way that violates the rights of others or restricts anyone else’s use and enjoyment of the app.\n\n',
                          style: TextStyle(fontSize: 18),
                        ),

                        // 2. Privacy
                        TextSpan(
                          text: '2. Privacy\n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              'We respect your privacy. This app does not store or share any recordings unless explicitly permitted by you. All screen recordings are saved locally on your device.\n\n',
                          style: TextStyle(fontSize: 18),
                        ),

                        // 3. Permissions
                        TextSpan(
                          text: '3. Permissions\n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              'To function correctly, the app may request permissions to access your microphone, screen, and storage. These permissions are essential and will only be used to enable screen recording features.\n\n',
                          style: TextStyle(fontSize: 18),
                        ),

                        // 4. Data Security
                        TextSpan(
                          text: '4. Data Security\n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              'We do not collect or store any personal data. It is your responsibility to keep your recordings and sensitive content secure on your device.\n\n',
                          style: TextStyle(fontSize: 18),
                        ),

                        // 5. Limitations
                        TextSpan(
                          text: '5. Limitations\n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              'We provide this app "as is" without warranties of any kind. We are not liable for any direct or indirect loss or damage arising from the use of the app.\n\n',
                          style: TextStyle(fontSize: 18),
                        ),

                        // 6. Content Responsibility
                        TextSpan(
                          text: '6. Content Responsibility\n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              'You are fully responsible for the content you record, store, or share using this app. Do not use the app to create or distribute illegal or harmful content.\n\n',
                          style: TextStyle(fontSize: 18),
                        ),

                        // 7. Updates
                        TextSpan(
                          text: '7. Updates\n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              'We may update these terms at any time. Changes will be effective upon posting. Continued use of the app indicates your acceptance of the revised terms.\n\n',
                          style: TextStyle(fontSize: 18),
                        ),

                        // 8. Support
                        TextSpan(
                          text: '8. Support\n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              'If you have any questions or need help, please contact our support team at support@screenrecorder.com.\n\n',
                          style: TextStyle(fontSize: 18),
                        ),

                        // Final Statement
                        TextSpan(
                          text:
                              'By using this app, you confirm that you have read, understood, and agreed to these terms and conditions.',
                          style: TextStyle(fontSize: 18),
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
