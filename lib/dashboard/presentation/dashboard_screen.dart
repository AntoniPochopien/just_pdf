import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_pdf/common/widgets/just_pdf_app_bar.dart';
import 'package:just_pdf/common/wrappers/route_aware_wrapper.dart';
import 'package:just_pdf/dashboard/application/cubit/dashboard_cubit.dart';
import 'package:just_pdf/dashboard/domain/i_dashboard_repository.dart';
import 'package:just_pdf/dashboard/domain/options.dart';
import 'package:just_pdf/dashboard/presentation/widgets/files_list_view.dart';
import 'package:just_pdf/dashboard/presentation/widgets/language_change_button.dart';
import 'package:just_pdf/dashboard/presentation/widgets/option_pill.dart';
import 'package:just_pdf/di.dart';
import 'package:just_pdf/l10n/l10n.dart';
import 'package:just_pdf/local_storage/domain/i_local_storage_repository.dart';
import 'package:just_pdf/navigation/app_router.dart';
import 'package:just_pdf/printing/domain/i_printing_repository.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(
        dashboardRepository: getIt<IDashboardRepository>(),
        localStorageRepository: getIt<ILocalStorageRepository>(),
        printingRepository: getIt<IPrintingRepository>(),
      )..init(),
      child: BlocListener<DashboardCubit, DashboardState>(
        listener: (context, state) {
          state.whenOrNull(
              openPdf: (openPdf, _) =>
                  context.pushRoute(PdfViewerRoute(fileMetadata: openPdf)));
        },
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) => RouteAwareWrapper(
            onDidPopNext: () => context.read<DashboardCubit>().reloadFiles(),
            child: Scaffold(
              appBar: const JustPdfAppBar(actions: [LanguageChangeButton()]),
              body: state.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                orElse: () => Column(
                  children: [
                    SingleChildScrollView(
                      child: Row(
                          children: Options.values
                              .map((e) => OptionPill(
                                  onTap: () => e.onTap(context),
                                  selected: state.maybeWhen(
                                    lastSeenFiles: (_) =>
                                        Options.lastSeen == e ? true : false,
                                    alphabeticalOrderFiles: (_) =>
                                        Options.alphabeticalOrder == e
                                            ? true
                                            : false,
                                    orElse: () => false,
                                  ),
                                  text: e.getTitle(context)))
                              .toList()),
                    ),
                    state.maybeWhen(
                      lastSeenFiles: (lastSeenFiles) =>
                          FilesListView(files: lastSeenFiles),
                      alphabeticalOrderFiles: (alphabeticalFiles) =>
                          FilesListView(files: alphabeticalFiles),
                      orElse: () => const SizedBox(),
                    )
                  ],
                ),
              ),
              floatingActionButton: ElevatedButton(
                  child: Text(T(context).search_on_your_phone),
                  onPressed: () =>
                      context.read<DashboardCubit>().pickPdfFile()),
            ),
          ),
        ),
      ),
    );
  }
}
