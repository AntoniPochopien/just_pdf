import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:just_pdf/constants/dim.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/l10n/l10n.dart';

class ContextMenuDialog extends StatelessWidget {
  final FileMetadata fileMetadata;
  final Function onDelete;
  final Function onPrint;
  final Function onShare;
  const ContextMenuDialog(
      {super.key,
      required this.fileMetadata,
      required this.onDelete,
      required this.onPrint,
      required this.onShare});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: Dim.dialogPadding,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('${T(context).name}: ${fileMetadata.getName}'),
          Text(
              '${T(context).size}: ${fileMetadata.getSize.toStringAsFixed(2)}Mb'),
        ]),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
              icon: const Icon(Icons.print),
              onPressed: () {
                onPrint();
                context.maybePop();
              }),
          IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                onShare();
                context.maybePop();
              }),
          IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                onDelete();
                context.maybePop();
              }),
        ]),
      ]),
    ));
  }
}
