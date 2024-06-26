import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';

@RoutePage()
class PdfViewerScreen extends StatelessWidget {
  final FileMetadata fileMetadata;
  const PdfViewerScreen({super.key, required this.fileMetadata});

  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: fileMetadata.filePath,
    );
  }
}
