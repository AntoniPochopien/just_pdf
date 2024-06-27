import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:just_pdf/constants/font.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/navigation/app_router.dart';

class FilteTile extends StatelessWidget {
  final FileMetadata fileMetadata;
  const FilteTile({super.key, required this.fileMetadata});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () =>
            context.pushRoute(PdfViewerRoute(fileMetadata: fileMetadata)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            const Icon(Icons.picture_as_pdf, size: 32),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileMetadata.getName,
                      style: Font.h4Dark,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      '${fileMetadata.getSize.toStringAsFixed(2)}Mb',
                      style: Font.h5Dark
                          .copyWith(color: Colors.black.withOpacity(0.6)),
                    )
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
