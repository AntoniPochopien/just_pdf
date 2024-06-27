import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_pdf/constants/dim.dart';
import 'package:just_pdf/dashboard/application/cubit/dashboard_cubit.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/l10n/l10n.dart';

class ContextMenuDialog extends StatelessWidget {
  final FileMetadata fileMetadata;
  final BuildContext ctx;
  const ContextMenuDialog({super.key, required this.ctx, required this.fileMetadata});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: Dim.dialogPadding,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('${T(context).name}: ${fileMetadata.getName}'),
          Text('${T(context).size}: ${fileMetadata.getSize.toStringAsFixed(2)}Mb'),
        ]),
        const SizedBox(height: 8),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () {
              ctx.read<DashboardCubit>().deleteFile(fileMetadata);
              context.maybePop();
            },
            child: Text(T(context).delete)),
      ]),
    ));
  }
}
