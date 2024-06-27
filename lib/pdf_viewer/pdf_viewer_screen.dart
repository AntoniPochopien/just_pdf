import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:just_pdf/common/widgets/just_pdf_app_bar.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';

@RoutePage()
class PdfViewerScreen extends StatefulWidget {
  final FileMetadata fileMetadata;
  const PdfViewerScreen({super.key, required this.fileMetadata});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  int? _pagesCount;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JustPdfAppBar(
        actions: [if (_pagesCount != null) Text('${_currentPage+1}/$_pagesCount')],
      ),
      body: PDFView(
        filePath: widget.fileMetadata.filePath,
        onPageChanged: (page, total) {
          setState(() {
            _currentPage = page!;
            _pagesCount = total;
          });
        },
      ),
    );
  }
}
