import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mama/src/data.dart';
import 'package:flutter/services.dart' show rootBundle;

class PdfView extends StatelessWidget {
  final String path;
  const PdfView({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: FutureBuilder(
          future: rootBundle.load(path),
          builder: (context, snapshot) {
            final file = snapshot.data?.buffer.asUint8List();

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return PDFView(
              pdfData: file,
            );
          }),
    );
  }
}
