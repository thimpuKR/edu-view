import 'package:flutter/material.dart';

class PlaybackControls extends StatefulWidget {
  final Function onPlay;
  final Function onPause;
  final Function(double) onSpeedChange;

  PlaybackControls({
    required this.onPlay,
    required this.onPause,
    required this.onSpeedChange,
  });

  @override
  _PlaybackControlsState createState() => _PlaybackControlsState();
}

class _PlaybackControlsState extends State<PlaybackControls> {
  double playbackSpeed = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () => widget.onPlay(),
            ),
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: () => widget.onPause(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Speed: '),
            DropdownButton<double>(
              value: playbackSpeed,
              items: const [
                DropdownMenuItem(
                  value: 0.5,
                  child: Text('0.5x'),
                ),
                DropdownMenuItem(
                  value: 1.0,
                  child: Text('1x'),
                ),
                DropdownMenuItem(
                  value: 1.5,
                  child: Text('1.5x'),
                ),
                DropdownMenuItem(
                  value: 2.0,
                  child: Text('2x'),
                ),
              ],
              onChanged: (double? value) {
                if (value != null) {
                  setState(() {
                    playbackSpeed = value;
                  });
                  widget.onSpeedChange(value);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
