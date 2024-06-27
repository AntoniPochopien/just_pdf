import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:just_pdf/constants/dim.dart';
import 'package:just_pdf/constants/font.dart';
import 'package:just_pdf/dashboard/application/cubit/dashboard_cubit.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/dashboard/presentation/widgets/context_menu_dialog.dart';

class FilteTile extends StatelessWidget {
  final FileMetadata fileMetadata;
  const FilteTile({super.key, required this.fileMetadata});

  static final _dateFormat = DateFormat('dd-MM-yyyy hh:mm');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dim.verticalPadding,
      child: InkWell(
        borderRadius: BorderRadius.circular(Dim.radius),
        onTap: () {
          context.read<DashboardCubit>().onFileTap(fileMetadata);
        },
        onLongPress: () => showDialog(
          context: context,
          builder: (ctx) => ContextMenuDialog(ctx: context,fileMetadata: fileMetadata),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            const Icon(Icons.picture_as_pdf, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileMetadata.getName,
                      style: Font.h4Dark,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${fileMetadata.getSize.toStringAsFixed(2)}Mb',
                            style: Font.h5Dark
                                .copyWith(color: Colors.black.withOpacity(0.6)),
                          ),
                          Flexible(
                            child: FittedBox(
                              child: Text(
                                'Ostatnio widziane:\n${_dateFormat.format(fileMetadata.lastViewed)}',
                                textAlign: TextAlign.end,
                                style: Font.h5Dark.copyWith(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                          )
                        ])
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
