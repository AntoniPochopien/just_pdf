import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_pdf/common/widgets/just_pdf_app_bar.dart';
import 'package:just_pdf/constants/dim.dart';
import 'package:just_pdf/dashboard/application/cubit/dashboard_cubit.dart';
import 'package:just_pdf/dashboard/presentation/widgets/file_tile.dart';
import 'package:just_pdf/l10n/application/cubit/language_cubit.dart';
import 'package:just_pdf/l10n/l10n.dart';
import 'package:just_pdf/navigation/app_router.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit()..init(),
      child: BlocListener<DashboardCubit, DashboardState>(
        listenWhen: (previous, current) =>
            previous.openPdf?.id != current.openPdf?.id,
        listener: (context, state) {
          if (state.openPdf != null) {
            context.pushRoute(PdfViewerRoute(fileMetadata: state.openPdf!));
          }
        },
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) => Scaffold(
            appBar: JustPdfAppBar(actions: [
              PopupMenuButton(
                child: const Icon(Icons.language),
                itemBuilder: (context) => L10n.supported
                    .map((e) => PopupMenuItem(
                        value: e,
                        child: Text(L10n.getNativeLangName(e.languageCode))))
                    .toList(),
                onSelected: (value) =>
                    context.read<LanguageCubit>().setLocale(locale: value),
              )
            ]),
            body: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: Dim.screenPadding,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius:
                                      BorderRadius.circular(Dim.radius)),
                              child: Padding(
                                  padding: Dim.innerPadding,
                                  child: Text(T(context).recently_viewed))),
                          Expanded(
                            child: ListView.builder(
                                itemCount: state.lastSeenFiles.length,
                                itemBuilder: (context, index) => FilteTile(
                                    fileMetadata: state.lastSeenFiles[index])),
                          )
                        ]),
                  ),
            floatingActionButton: ElevatedButton(
                child: Text(T(context).search_on_your_phone),
                onPressed: () => context.read<DashboardCubit>().pickPdfFile()),
          ),
        ),
      ),
    );
  }
}
