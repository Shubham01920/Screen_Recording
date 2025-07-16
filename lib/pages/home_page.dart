// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:screen_recording/controller.dart/recording_controller.dart';
import 'package:screen_recording/widgets/home/app_header.dart';
import 'package:screen_recording/widgets/home/control_button.dart';
import 'package:screen_recording/widgets/home/recording_area.dart';
import 'package:screen_recording/widgets/home/setting_section.dart';

// Main app screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RecordingController _controller = RecordingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.requestPermissions(context));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListenableBuilder(
            listenable: _controller,
            builder: (context, child) {
              return Column(
                children: [
                  const AppHeader(),
                  const SizedBox(height: 40),
                  RecordingArea(controller: _controller),
                  const SizedBox(height: 40),
                  ControlButtons(controller: _controller),
                  const SizedBox(height: 30),
                  Expanded(child: SettingsSection(controller: _controller)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}