// lib/controllers/recording_controller.dart

import 'dart:async';
import 'dart:io' show File, Directory, Platform;
import 'package:flutter/material.dart';
import 'package:flutter_screen_recording/flutter_screen_recording.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screen_recording/model/setting_model.dart';
import 'package:screen_recording/theme/app_color.dart';

// Manages all recording state & logic
class RecordingController with ChangeNotifier {
  // --- State Variables ---
  bool _isRecording = false;
  bool _isPaused = false;
  String _recordingTime = "00:00";
  Timer? _timer;
  int _seconds = 0;
  String? _recordingPath;
  RecordingSettings _settings = const RecordingSettings();

  // --- Getters (for UI to read state safely) ---
  bool get isRecording => _isRecording;
  bool get isPaused => _isPaused;
  String get recordingTime => _recordingTime;
  RecordingSettings get settings => _settings;
  String? get recordingPath => _recordingPath;

  // --- State Management ---
  void updateSettings(RecordingSettings newSettings) {
    _settings = newSettings;
    notifyListeners(); // Tell UI to rebuild
  }

  // --- Core Functionality ---

  // Ask for permissions
  Future<void> requestPermissions(BuildContext context) async {
    final statuses = await [
      Permission.microphone,
      Permission.storage,
    ].request();
    // If any permission is denied, show a dialog
    if (statuses.values.any((status) => status.isDenied)) {
      _showPermissionDialog(context);
    }
  }

  // Start recording
  Future<void> startRecording(BuildContext context) async {
    try {
      if (settings.enableCountdown) {
        // Show countdown snackbars
        for (int i = 3; i > 0; i--) {
          _showSnackbar(context, 'Starting in $i...', AppColors.grey);
          await Future.delayed(const Duration(seconds: 1));
        }
      }

      String fileName =
          'rec_${DateTime.now().millisecondsSinceEpoch}.${_settings.outputFormat.extension.toLowerCase()}';

      // Call the plugin to start recording
      if (await FlutterScreenRecording.startRecordScreen(fileName)) {
        _isRecording = true;
        _startTimer();
        _showSnackbar(context, 'Recording started!', Colors.green);
      }
    } catch (e) {
      _showSnackbar(context, 'Error: $e', Colors.red);
    }
    notifyListeners();
  }

  // Stop recording
  Future<void> stopRecording(BuildContext context) async {
    try {
      _recordingPath = await FlutterScreenRecording.stopRecordScreen;
      _isRecording = false;
      _isPaused = false;
      _stopTimer();
      if (_recordingPath != null) {
        _showSnackbar(context, 'Recording saved!', Colors.green);
        _showSaveDialog(context);
      }
    } catch (e) {
      _showSnackbar(context, 'Error: $e', Colors.red);
    }
    notifyListeners();
  }

  // Pause or resume
  void pauseResumeRecording(BuildContext context) {
    _isPaused = !_isPaused;
    if (_isPaused) {
      _timer?.cancel();
      _showSnackbar(context, 'Paused', Colors.orange);
    } else {
      _startTimer();
      _showSnackbar(context, 'Resumed', Colors.blue);
    }
    notifyListeners();
  }

  // Save file to Downloads folder
  Future<void> saveToDownloads(BuildContext context) async {
    if (_recordingPath == null) return;
    try {
      late final String savePath;

      if (Platform.isAndroid) {
        final dir = await getExternalStorageDirectory();
        if (dir == null) throw Exception('Unable to access external storage');
        savePath = '${dir.path}/Downloads';
        await Directory(savePath).create(recursive: true);
      } else if (Platform.isIOS) {
        final dir = await getApplicationDocumentsDirectory();
        savePath = '${dir.path}/Downloads';
        await Directory(savePath).create(recursive: true);
      } else {
        throw Exception('Platform not supported');
      }

      final newPath =
          '$savePath/rec_${DateTime.now().millisecondsSinceEpoch}.${_settings.outputFormat.extension.toLowerCase()}';
      await File(_recordingPath!).copy(newPath);
      _showSnackbar(context, 'Saved to Downloads folder', Colors.green);
    } catch (e) {
      _showSnackbar(context, 'Save error: $e', Colors.red);
    }
  }

  // --- Helper Methods ---

  // Timer logic
  void _startTimer() {
    _timer?.cancel(); // Ensure no other timers are running
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isPaused) {
        _seconds++;
        _recordingTime =
            "${(_seconds ~/ 60).toString().padLeft(2, '0')}:${(_seconds % 60).toString().padLeft(2, '0')}";
        notifyListeners();
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _seconds = 0;
    _recordingTime = "00:00";
  }

  // Show a temporary message
  void _showSnackbar(BuildContext context, String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Show a dialog for permission issues
  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.card,
        title: const Text(
          'Permissions Required',
          style: TextStyle(color: AppColors.white),
        ),
        content: const Text(
          'This app needs microphone and storage permissions to work.',
          style: TextStyle(color: AppColors.grey),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }

  // Show a dialog after recording is finished
  void _showSaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.card,
        title: const Text(
          'Recording Complete',
          style: TextStyle(color: AppColors.white),
        ),
        content: const Text(
          'Save the recording to your Downloads folder?',
          style: TextStyle(color: AppColors.grey),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Dismiss'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              saveToDownloads(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  // Clean up resources
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
