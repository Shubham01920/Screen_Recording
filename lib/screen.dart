import 'package:flutter/material.dart';
import 'package:flutter_screen_recording/flutter_screen_recording.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen Recorder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenRecorderPage(),
    );
  }
}

class ScreenRecorderPage extends StatefulWidget {
  const ScreenRecorderPage({super.key});

  @override
  _ScreenRecorderPageState createState() => _ScreenRecorderPageState();
}

class _ScreenRecorderPageState extends State<ScreenRecorderPage> {
  bool isRecording = false;
  String recordingPath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Recorder'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Status indicator
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isRecording ? Colors.red.withOpacity(0.1) : Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Icon(
                    isRecording ? Icons.fiber_manual_record : Icons.videocam_off,
                    size: 50,
                    color: isRecording ? Colors.red : Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Text(
                    isRecording ? 'Recording...' : 'Ready to Record',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isRecording ? Colors.red : Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 40),
            
            // Start/Stop Recording Button
            ElevatedButton(
              onPressed: isRecording ? stopRecording : startRecording,
              style: ElevatedButton.styleFrom(
                backgroundColor: isRecording ? Colors.red : Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Text(
                  isRecording ? 'Stop Recording' : 'Start Recording',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            
            SizedBox(height: 20),
            
            // Show recording path if available
            if (recordingPath.isNotEmpty)
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      'Last Recording:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      recordingPath,
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Function to start recording
  Future<void> startRecording() async {
    try {
      // Request permissions first
      await requestPermissions();
      
      // Start recording
      bool started = await FlutterScreenRecording.startRecordScreen("recording");
      
      if (started) {
        setState(() {
          isRecording = true;
        });
        
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Recording started!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      print('Error starting recording: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to start recording: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Function to stop recording
  Future<void> stopRecording() async {
    try {
      String? path = await FlutterScreenRecording.stopRecordScreen;
      
      setState(() {
        isRecording = false;
        recordingPath = path;
      });
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Recording stopped and saved!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print('Error stopping recording: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to stop recording: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Function to request necessary permissions
  Future<void> requestPermissions() async {
    // Request microphone permission
    await Permission.microphone.request();
    
    // Request storage permission
    await Permission.storage.request();
    
    // For Android 11 and above, request manage external storage
    if (await Permission.manageExternalStorage.isDenied) {
      await Permission.manageExternalStorage.request();
    }
  }
}