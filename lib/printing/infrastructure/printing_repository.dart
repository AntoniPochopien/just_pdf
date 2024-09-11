import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:just_pdf/common/domain/failure.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/printing/domain/i_printing_repository.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

class PrintingRepository implements IPrintingRepository {
  @override
  Future<Either<Failure, Unit>> print(FileMetadata fileMetadata) async {
    try {
      final file = File(fileMetadata.filePath);
      await Printing.layoutPdf(
        onLayout: (format) async => await file.readAsBytes(),
        name: fileMetadata.getName,
      );
      return right(unit);
    } catch (e) {
      log('print unexpected error: $e');
      return left(const Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, Unit>> share(List<FileMetadata> fileMetadataList) async {
    try {
      final xFiles = fileMetadataList.map((e) => XFile(e.filePath)).toList();
      await Share.shareXFiles(xFiles);
      return right(unit);
    } catch (e) {
      log('share unexpected error: $e');
      return left(const Failure.unexpected());
    }
  }
}
