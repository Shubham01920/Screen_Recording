import 'package:flutter/material.dart';
import 'package:screen_recording/theme/app_color.dart';
import 'package:screen_recording/widgets/build_header.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRecording = false;
  bool isPaused = false;
  String recordingTime = "00:00";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // Top Header
             BuildHeader(),
              
              SizedBox(height: 40),
              
              // Recording Display Area
              _buildRecordingArea(),
              
              SizedBox(height: 40),
              
              // Control Buttons
              _buildControlButtons(),
              
              SizedBox(height: 30),
              
              // Settings Options
              _buildSettingsOptions(),
            ],
          ),
        ),
      ),
    );
  }
  
  // Main recording area with timer
  Widget _buildRecordingArea() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isRecording ? AppColors.red : AppColors.grey,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Recording indicator
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: isRecording ? AppColors.red : AppColors.grey,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isRecording ? Icons.stop : Icons.videocam,
              color: AppColors.white,
              size: 30,
            ),
          ),
          
          SizedBox(height: 20),
          
          // Timer
          Text(
            recordingTime,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          SizedBox(height: 10),
          
          // Status text
          Text(
            isRecording ? 'Recording...' : 'Ready to Record',
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
  
  // Control buttons (Start, Pause, Stop)
  Widget _buildControlButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Start/Stop Button
        _buildControlButton(
          icon: isRecording ? Icons.stop : Icons.play_arrow,
          color: isRecording ? AppColors.red : AppColors.purple,
          onPressed: () {
            setState(() {
              isRecording = !isRecording;
              if (!isRecording) {
                isPaused = false;
                recordingTime = "00:00";
              }
            });
          },
        ),
        
        // Pause Button
        _buildControlButton(
          icon: isPaused ? Icons.play_arrow : Icons.pause,
          color: AppColors.purple,
          onPressed: isRecording ? () {
            setState(() {
              isPaused = !isPaused;
            });
          } : null,
        ),
        
        // Download Button
        _buildControlButton(
          icon: Icons.download,
          color: AppColors.purple,
          onPressed: () {
            // Add download logic later
            print('Download pressed');
          },
        ),
      ],
    );
  }
  
  // Helper method to create control buttons
  Widget _buildControlButton({
    required IconData icon,
    required Color color,
    required VoidCallback? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: onPressed != null ? color : AppColors.grey,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: AppColors.white,
          size: 30,
        ),
      ),
    );
  }
  
  // Settings options
  Widget _buildSettingsOptions() {
    return Column(
      children: [
        _buildSettingItem(
          title: 'Include Audio',
          subtitle: 'Record system and microphone audio',
          trailing: Switch(
            value: true,
            onChanged: (value) {
              // Handle audio toggle
            },
            activeColor: AppColors.purple,
          ),
        ),
        
        SizedBox(height: 15),
        
        _buildSettingItem(
          title: 'Video Quality',
          subtitle: 'HD (1080p)',
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.grey,
            size: 16,
          ),
        ),
        
        SizedBox(height: 15),
        
        _buildSettingItem(
          title: 'Output Format',
          subtitle: 'MP4',
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.grey,
            size: 16,
          ),
        ),
      ],
    );
  }
  
  // Helper method for setting items
  Widget _buildSettingItem({
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}