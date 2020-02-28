import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:blendedlearningtoolkit/pdf_screen.dart';

class LaunchFile {
  Future<void> launchPDF(BuildContext context, String title, Uint8List data) async {
      prepareTestPdf(context, title, data).then((path) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PDFScreen(title, path)
            ),
          );
        });
      }
      
  Future<String> prepareTestPdf(context, title, data) async {
    final filename = title+'.pdf';
    var dir = (await getApplicationDocumentsDirectory()).path;
    print(dir);
    File file = File('$dir/$filename');
    file.writeAsBytesSync(data);
    return ('$dir/$filename');
  }
}