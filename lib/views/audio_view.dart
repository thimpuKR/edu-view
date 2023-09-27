import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/audio_controller.dart';

class AudioView extends StatefulWidget {
  final AudioController audioController;

  AudioView({required this.audioController});

  @override
  _AudioViewState createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            if (widget.audioController.isRecording) {
              await widget.audioController.stopRecording();
            } else {
              await widget.audioController.startRecording();
            }
            setState(() {});
          },
          child: Text(
            widget.audioController.isRecording
                ? 'Stop Recording'
                : 'Start Recording',
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            if (widget.audioController.isPlaying) {
              await widget.audioController.stopPlaying();
            } else {
              await widget.audioController.startPlaying();
            }
            setState(() {});
          },
          child: Text(
            widget.audioController.isPlaying ? 'Stop Playing' : 'Start Playing',
          ),
        ),
      ],
    );
  }
}
