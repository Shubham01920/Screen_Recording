import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:screen_recording/theme/app_color.dart';
import 'package:screen_recording/widgets/common/page_indicator.dart';


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/image_1.png",
      "title": "Record",
      "subtitle": "Quickly record your videos no\nmatter where you are!",
    },
    {
      "image": "assets/images/image_2.png",
      "title": "Share",
      "subtitle": "Share your creations with\nthe world in one click.",
    },
    {
      "image": "assets/images/image_3.png",
      "title": "Download",
      "subtitle": "Save your favorite content\nand watch it offline.",
    },
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;
  late TapGestureRecognizer _signInRecognizer;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });

    _signInRecognizer = TapGestureRecognizer()
      ..onTap = () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigating to Sign In...')),
        );
      };
  }

  @override
  void dispose() {
    _pageController.dispose();
    _signInRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22.0, 22.0, 22.0, 30.0),
          child: Column(
            children: [
              // Onboarding content
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) {
                    final item = _onboardingData[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          item['image']!,
                          height: 260,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.image_not_supported,
                              size: 260,
                              color: AppColors.grey,
                            );
                          },
                        ),
                        const SizedBox(height: 40),
                        Text(
                          item['title']!,
                          style: const TextStyle(
                            fontSize: 32,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          item['subtitle']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Page indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingData.length,
                  (index) => PageIndicatorDot(isActive: _currentPage == index),
                ),
              ),

              const SizedBox(height: 40),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppColors.purple,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    print("Sign Up button pressed!");
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Sign In Link
              Text.rich(
                TextSpan(
                  style: const TextStyle(fontSize: 16, color: AppColors.grey),
                  children: [
                    const TextSpan(text: 'Already have an account? '),
                    TextSpan(
                      text: 'Sign In',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.purple,
                      ),
                      recognizer: _signInRecognizer,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
