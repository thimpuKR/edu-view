import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/drawing_point.dart';

class DrawingPainter extends CustomPainter {
  final List<DrawingPoint?> points;

  DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        Paint paint = points[i]!.paint!;
        Offset start = points[i]!.point!;
        Offset end = points[i + 1]!.point!;
        canvas.drawLine(start, end, paint);
      } else if (points[i] != null && points[i + 1] == null) {
        Paint paint = points[i]!.paint!;
        Offset point = points[i]!.point!;
        canvas.drawCircle(point, 0.1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
