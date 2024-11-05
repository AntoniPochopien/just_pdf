import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:just_pdf/common/widgets/just_pdf_app_bar.dart';
import 'package:just_pdf/dashboard/application/dashboard_cubit/dashboard_cubit.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/di.dart';
import 'package:just_pdf/pdf_viewer/application/cubit/pdf_viewer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_pdf/pdf_viewer/domain/operations.dart';
import 'package:just_pdf/printing/domain/i_printing_repository.dart';

@RoutePage()
class PdfViewerScreen extends StatefulWidget {
  final FileMetadata fileMetadata;
  final DashboardCubit dashboardCubit;
  const PdfViewerScreen({
    super.key,
    required this.fileMetadata,
    required this.dashboardCubit,
  });

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  int? _pagesCount;
  int _currentPage = 0;
  late bool favorite;

  @override
  void initState() {
    super.initState();
    favorite = widget.fileMetadata.favorite;
  }

  List<PopupMenuEntry<Operations>> getMenuItems(BuildContext context) =>
      Operations.values
          .map(
            (e) => PopupMenuItem(
                value: e,
                child: ListTile(
                  title: Text(e.getName(context)),
                  trailing: Icon(e.getIcon()),
                )),
          )
          .toList();

  void onPopupMenuSelected(BuildContext context,
      {required Operations operation}) {
    switch (operation) {
      case Operations.print:
        context.read<PdfViewerCubit>().print(widget.fileMetadata);
      case Operations.share:
        context.read<PdfViewerCubit>().share(widget.fileMetadata);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => PdfViewerCubit(
                printingRepository: getIt<IPrintingRepository>())),
        BlocProvider.value(value: widget.dashboardCubit),
      ],
      child: BlocBuilder<PdfViewerCubit, PdfViewerState>(
        builder: (context, state) => Scaffold(
            appBar: JustPdfAppBar(
              actions: [
                if (_pagesCount != null)
                  Row(children: [
                    IconButton(
                      icon: Icon(
                          favorite ? Icons.favorite : Icons.favorite_border),
                      onPressed: () {
                        context
                            .read<DashboardCubit>()
                            .toggleFavorite(widget.fileMetadata);
                        setState(() {
                          favorite = !favorite;
                        });
                      },
                    ),
                    if (_pagesCount != null)
                      Text('${_currentPage + 1}/$_pagesCount'),
                    PopupMenuButton<Operations>(
                      itemBuilder: (context) => getMenuItems(context),
                      onSelected: (value) =>
                          onPopupMenuSelected(context, operation: value),
                    )
                  ])
              ],
            ),
            body: PDFView(
                filePath: widget.fileMetadata.filePath,
                onLinkHandler: (url) =>
                    context.read<PdfViewerCubit>().uriLaunch(url),
                onRender: (pages) => setState(() => _pagesCount = pages),
                onPageChanged: (page, total) =>
                    setState(() => _currentPage = page!))),
      ),
    );
  }
}
