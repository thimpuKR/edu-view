import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/drawing_controller.dart';
import 'package:flutter_application_1/views/main_view.dart';
import 'package:flutter_application_1/widgets/playback_controls.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drawing and Playback App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final drawingController = DrawingController();
  void handlePlay() {
    // Handle play button press
  }

  void handlePause() {
    // Handle pause button press
  }

  void handleSpeedChange(double speed) {
    // Handle speed change
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Drawing and Playback App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: MainView(),
          ),
          PlaybackControls(
            onPlay: handlePlay,
            onPause: handlePause,
            onSpeedChange: handleSpeedChange,
          ),
        ],
      ),
    );
  }
}
