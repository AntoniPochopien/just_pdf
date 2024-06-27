import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_pdf/common/widgets/just_pdf_app_bar.dart';
import 'package:just_pdf/constants/dim.dart';
import 'package:just_pdf/dashboard/application/cubit/dashboard_cubit.dart';
import 'package:just_pdf/dashboard/presentation/widgets/file_tile.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DashboardCubit()..init(),
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
                    decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(Dim.radius)),
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
                child: Text('sda'),
                onPressed: () => context.read<DashboardCubit>().pickPdfFile()),
          ),
        ));
  }
}
