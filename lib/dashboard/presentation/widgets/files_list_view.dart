import 'package:flutter/material.dart';
import 'package:just_pdf/constants/dim.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/dashboard/presentation/widgets/file_tile.dart';

class FilesListView extends StatelessWidget {
  final List<FileMetadata> files;
  const FilesListView({super.key, required this.files});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: Dim.screenPadding,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: ListView.builder(
                itemCount: files.length,
                itemBuilder: (context, index) =>
                    FileTile(fileMetadata: files[index])),
          )
        ]),
      ),
    );
  }
}
