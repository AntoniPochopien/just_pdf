import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:just_pdf/common/domain/failure.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/dashboard/domain/i_dashboard_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class DashboardRepository implements IDashboardRepository {
  static const platform = MethodChannel('pdf_opener_channel');

  @override
  Future<bool> requestStoragePermission() async {
    final status = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }
    return status.isGranted;
  }

  @override
  Future<bool> checkStoragePermission() async =>
      await Permission.manageExternalStorage.status.isGranted;

  @override
  Future<Either<Failure, FileMetadata>> getPdfFromIntent() async {
    try {
      final result =
          await platform.invokeMethod<List<dynamic>>('getPdfDetails');
      final details = result!.cast<String>();
      return right(FileMetadata(
          id: '',
          filePath: details[0],
          name: details[1],
          lastViewed: DateTime.now(),
          sizeInBytes: int.parse(details[2])));
    } on PlatformException catch (e) {
      log('getPdfFromIntent error: $e');
      return left(const Failure.unexpected());
    }
  }
}
