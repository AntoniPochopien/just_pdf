import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_pdf/common/widgets/just_pdf_app_bar.dart';
import 'package:just_pdf/constants/dim.dart';
import 'package:just_pdf/dashboard/application/cubit/dashboard_cubit.dart';
import 'package:just_pdf/dashboard/presentation/widgets/file_tile.dart';
import 'package:just_pdf/navigation/app_router.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DashboardCubit()..init(),
        child: BlocListener<DashboardCubit, DashboardState>(
          listenWhen: (previous, current) {
            final previousData = previous.mapOrNull(data: (value) => value);
            final currentData = current.mapOrNull(data: (value) => value);
            if (previousData == null || currentData == null) return false;
            if (previousData.lastSeenFiles.length !=
                currentData.lastSeenFiles.length) {
              return true;
            } else {
              return false;
            }
          },
          listener: (context, state) {
            state.mapOrNull(data: (value) {
              if (value.lastSeenFiles.isNotEmpty) {
                context.pushRoute(
                    PdfViewerRoute(fileMetadata: value.lastSeenFiles.first));
              }
            });
          },
          child: BlocBuilder<DashboardCubit, DashboardState>(
            builder: (context, state) => Scaffold(
              appBar: const JustPdfAppBar(),
              body: state.maybeMap(
                orElse: () => const Center(child: CircularProgressIndicator()),
                data: (value) => Padding(
                  padding: Dim.screenPadding,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius:
                                    BorderRadius.circular(Dim.radius)),
                            child: const Padding(
                                padding: Dim.innerPadding,
                                child: Text('Ostatnio przeglądane'))),
                        Expanded(
                          child: ListView.builder(
                              itemCount: value.lastSeenFiles.length,
                              itemBuilder: (context, index) => FilteTile(
                                  fileMetadata: value.lastSeenFiles[index])),
                        )
                      ]),
                ),
              ),
              floatingActionButton: ElevatedButton(
                  child: Text('Szukaj w telefonie'),
                  onPressed: () =>
                      context.read<DashboardCubit>().pickPdfFile()),
            ),
          ),
        ));
  }
}
