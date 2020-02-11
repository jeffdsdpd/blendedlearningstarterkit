import 'package:flutter/material.dart';
import 'package:blendedlearningstarterkit/pdf_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';

class LaunchFile {
  static void launchPDF(BuildContext context, String title, String pdfPath, String pdfUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFScreen(title, pdfPath, pdfUrl),
      ),
    );
  }

  static Future<dynamic> loadFromFirebase(String image, String url) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}