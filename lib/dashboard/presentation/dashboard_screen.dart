import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_pdf/dashboard/application/cubit/dashboard_cubit.dart';
import 'package:just_pdf/l10n/l10n.dart';
import 'package:just_pdf/navigation/app_router.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DashboardCubit()..init(),
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) => Scaffold(
            appBar: AppBar(title: Text(T(context).app_name)),
            body: state.maybeMap(
              orElse: () => const Center(child: CircularProgressIndicator()),
              data: (value) => ListView.builder(
                itemCount: value.lastSeenFiles.length,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () => context.pushRoute(PdfViewerRoute(
                        fileMetadata: value.lastSeenFiles[index])),
                    child: Text(value.lastSeenFiles[index].filePath)),
              ),
            ),
            floatingActionButton: ElevatedButton(
                child: Text('sda'),
                onPressed: () => context.read<DashboardCubit>().pickPdfFile()),
          ),
        ));
  }
}
