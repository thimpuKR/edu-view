import 'package:flutter_sound/flutter_sound.dart';

class AudioController {
  late FlutterSoundRecorder _audioRecorder;
  late FlutterSoundPlayer _audioPlayer;
  bool _isRecording = false;
  bool _isPlaying = false;

  AudioController() {
    _audioRecorder = FlutterSoundRecorder();
    _audioPlayer = FlutterSoundPlayer();
  }

  Future<void> startRecording() async {
    await _audioRecorder.openAudioSession();
    await _audioRecorder.startRecorder(
      toFile: 'audio_record.aac',
      codec: Codec.aacADTS,
    );
    _isRecording = true;
  }

  Future<void> stopRecording() async {
    await _audioRecorder.stopRecorder();
    await _audioRecorder.closeAudioSession();
    _isRecording = false;
  }

  Future<void> startPlaying() async {
    await _audioPlayer.startPlayer(
      fromURI: 'audio_record.aac',
      codec: Codec.aacADTS,
    );
    _isPlaying = true;
  }

  Future<void> stopPlaying() async {
    await _audioPlayer.stopPlayer();
    _isPlaying = false;
  }

  bool get isRecording => _isRecording;
  bool get isPlaying => _isPlaying;
}
