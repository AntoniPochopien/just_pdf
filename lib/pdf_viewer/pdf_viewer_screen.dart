import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:just_pdf/common/widgets/just_pdf_app_bar.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/di.dart';
import 'package:just_pdf/pdf_viewer/application/cubit/pdf_viewer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_pdf/printing/domain/i_printing_repository.dart';
import 'package:pdfrx/pdfrx.dart';

@RoutePage()
class PdfViewerScreen extends StatefulWidget {
  final FileMetadata fileMetadata;
  const PdfViewerScreen({super.key, required this.fileMetadata});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  int? _pagesCount;
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PdfViewerCubit(printingRepository: getIt<IPrintingRepository>()),
      child: BlocBuilder<PdfViewerCubit, PdfViewerState>(
        builder: (context, state) => Scaffold(
            appBar: JustPdfAppBar(
              actions: [
                if (_pagesCount != null)
                  Row(children: [
                    IconButton(
                      icon: const Icon(Icons.print),
                      onPressed: () => context
                          .read<PdfViewerCubit>()
                          .print(widget.fileMetadata),
                    ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () => context
                          .read<PdfViewerCubit>()
                          .share(widget.fileMetadata),
                    ),
                    Text('$_currentPage/$_pagesCount')
                  ])
              ],
            ),
            body: PdfViewer.file(
              widget.fileMetadata.filePath,
              params: PdfViewerParams(
                  backgroundColor: Colors.white,
                  calculateInitialPageNumber: (document, controller) {
                    if (_pagesCount == null) {
                      setState(() {
                        _pagesCount = document.pages.length;
                      });
                    }
                    return 0;
                  },
                  enableTextSelection: true,
                  onPageChanged: (pageNumber) {
                    setState(() {
                      _currentPage = pageNumber ?? 0;
                    });
                  },
                  linkHandlerParams: PdfLinkHandlerParams(
                      onLinkTap: (url) =>
                          context.read<PdfViewerCubit>().uriLaunch(url.url))),
            )),
      ),
    );
  }
}
