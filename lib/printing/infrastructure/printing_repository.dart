import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:just_pdf/common/domain/failure.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/printing/domain/i_printing_repository.dart';
import 'package:printing/printing.dart';

class PrintingRepository implements IPrintingRepository {
  @override
  Future<Either<Failure, Unit>> print(FileMetadata fileMetadata) async {
    try {
      final file = File(fileMetadata.filePath);
      await Printing.layoutPdf(
          onLayout: (format) async => await file.readAsBytes(),
          name: fileMetadata.getName);
      return right(unit);
    } catch (e) {
      log('print unexpected error: $e');
      return left(const Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, Unit>> share(FileMetadata fileMetadata) async {
    try {
      final file = File(fileMetadata.filePath);
      await Printing.sharePdf(
          bytes: await file.readAsBytes(), filename: 'my-document.pdf');
      return right(unit);
    } catch (e) {
      log('share unexpected error: $e');
      return left(const Failure.unexpected());
    }
  }
}
