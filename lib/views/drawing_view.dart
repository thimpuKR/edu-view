import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/drawing_controller.dart';
import 'package:flutter_application_1/models/drawing_point.dart';

class DrawingView extends StatefulWidget {
  final DrawingController drawingController;

  DrawingView({required this.drawingController});

  @override
  _DrawingViewState createState() => _DrawingViewState();
}

class _DrawingViewState extends State<DrawingView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          widget.drawingController.addPoint(
            renderBox.globalToLocal(details.globalPosition),
            Paint()
              ..color = Colors.black
              ..strokeCap = StrokeCap.round
              ..strokeWidth = 5.0,
          );
        });
      },
      onPanEnd: (details) {
        widget.drawingController.addPoint(null, null);
      },
      child: CustomPaint(
        painter: DrawingPainter(widget.drawingController.points),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<DrawingPoint?> points;

  DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        // Null 검사를 수행합니다.
        Offset start = points[i]!.point ?? Offset.zero;
        Offset end = points[i + 1]!.point ?? Offset.zero;
        Paint paint = points[i]!.paint ?? Paint();

        canvas.drawLine(
          start,
          end,
          paint,
        );
      } else if (points[i] != null && points[i + 1] == null) {
        // Null 검사를 수행합니다.
        Offset point = points[i]!.point ?? Offset.zero;
        Paint paint = points[i]!.paint ?? Paint();

        canvas.drawCircle(point, 0.1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
