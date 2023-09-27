import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFAndDrawing extends StatefulWidget {
  final String pdfPath;

  PDFAndDrawing({required this.pdfPath});

  @override
  _PDFAndDrawingState createState() => _PDFAndDrawingState();
}

class _PDFAndDrawingState extends State<PDFAndDrawing> {
  late PDFViewController _pdfController;
  final List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PDFView(
          filePath: widget.pdfPath,
          onViewCreated: (PDFViewController pdfViewController) {
            _pdfController = pdfViewController;
          },
        ),
        CustomPaint(
          painter: MyPainter(points),
        ),
        GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              RenderBox renderBox = context.findRenderObject() as RenderBox;
              points.add(renderBox.globalToLocal(details.globalPosition));
            });
          },
          onPanEnd: (details) {
            points.add(null);
          },
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final List<Offset?> points;

  MyPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawPoints(PointMode.points, [points[i]!], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
