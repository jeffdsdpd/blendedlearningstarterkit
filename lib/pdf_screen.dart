import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class PDFScreen extends StatelessWidget {
  final String title;
  final String pdfPath;
  PDFScreen(this.title, this.pdfPath);

@override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF95D03A),
          title: Text(title),
        ),
        path: pdfPath);
  }
}