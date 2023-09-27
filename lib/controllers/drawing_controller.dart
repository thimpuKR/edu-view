import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/drawing_point.dart';

class DrawingController {
  List<DrawingPoint?> points = [];

  void addPoint(Offset? point, Paint? paint) {
    points.add(DrawingPoint(point: point, paint: paint));
  }

  void removeLastPoint() {
    if (points.isNotEmpty) {
      points.removeLast();
    }
  }

  void clearAllPoints() {
    points.clear();
  }
}
