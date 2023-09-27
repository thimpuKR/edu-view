import 'package:flutter/material.dart';

import 'pdf_and_drawing.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF and Drawing View'),
      ),
      body: PDFAndDrawing(pdfPath: 'assets/sample.pdf'),
    );
  }
}
