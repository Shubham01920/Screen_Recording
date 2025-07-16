// lib/models/settings_models.dart

// Video Quality
enum VideoQuality {
  lowest('144p', 'Lowest (144p)'),
  low('240p', 'Low (240p)'),
  medium('360p', 'Medium (360p)'),
  standard('480p', 'Standard (480p)'),
  high('720p', 'HD (720p)'),
  fullHd('1080p', 'Full HD (1080p)');

  const VideoQuality(this.resolution, this.displayName);
  final String resolution;
  final String displayName;
}

// File Format
enum OutputFormat {
  mp4('MP4', 'MP4 (Recommended)'),
  mov('MOV', 'MOV (Apple)'),
  avi('AVI', 'AVI (Windows)');

  const OutputFormat(this.extension, this.displayName);
  final String extension;
  final String displayName;
}

// Audio Source
enum AudioOption {
  systemOnly('System Audio', 'Record only system audio'),
  micOnly('Microphone Only', 'Record only microphone audio'),
  both('System + Microphone', 'Record both system and microphone audio'),
  none('No Audio', 'Record without audio');

  const AudioOption(this.title, this.description);
  final String title;
  final String description;
}

// Holds all settings
class RecordingSettings {
  final VideoQuality videoQuality;
  final OutputFormat outputFormat;
  final AudioOption audioOption;
  final bool enableCountdown;

  // Defaults
  const RecordingSettings({
    this.videoQuality = VideoQuality.high,
    this.outputFormat = OutputFormat.mp4,
    this.audioOption = AudioOption.both,
    this.enableCountdown = true,
  });

  // Copy helper
  RecordingSettings copyWith({
    VideoQuality? videoQuality,
    OutputFormat? outputFormat,
    AudioOption? audioOption,
    bool? enableCountdown,
  }) {
    return RecordingSettings(
      videoQuality: videoQuality ?? this.videoQuality,
      outputFormat: outputFormat ?? this.outputFormat,
      audioOption: audioOption ?? this.audioOption,
      enableCountdown: enableCountdown ?? this.enableCountdown,
    );
  }
}