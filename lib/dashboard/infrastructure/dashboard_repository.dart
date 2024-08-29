import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:just_pdf/common/domain/failure.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/dashboard/domain/i_dashboard_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DashboardRepository implements IDashboardRepository {
  static const platform = MethodChannel('pdf_opener_channel');

  @override
  Future<bool> requestStoragePermission() async {
    final statuses = await Future.wait([
      Permission.storage.status,
      Permission.manageExternalStorage.status,
    ]);

    final storageStatus = statuses[0];
    final manageExternalStorageStatus = statuses[1];

    if (!storageStatus.isGranted && !manageExternalStorageStatus.isGranted) {
      await [
        Permission.storage,
        Permission.manageExternalStorage,
      ].request();
    }
    return storageStatus.isGranted || manageExternalStorageStatus.isGranted;
  }

  @override
  Future<bool> checkStoragePermission() async {
    final statuses = await Future.wait([
      Permission.storage.status,
      Permission.manageExternalStorage.status,
    ]);
    final storageStatus = statuses[0];
    final manageExternalStorageStatus = statuses[1];
    return storageStatus.isGranted || manageExternalStorageStatus.isGranted;
  }

  @override
  Future<Either<Failure, FileMetadata?>> getPdfFromIntent() async {
    try {
      final result =
          await platform.invokeMethod<List<dynamic>>('getPdfDetails');
      if (result != null) {
        final details = result.cast<String>();

        final uriString = details[0];
        final fileName = details[1];

        final tempDir = await getTemporaryDirectory();
        final tempFilePath = "${tempDir.path}/$fileName";
        final tempFile = File(tempFilePath);

        await _copyFileFromUri(Uri.parse(uriString), tempFile);

        return right(FileMetadata(
            id: '',
            filePath: tempFile.path,
            name: fileName,
            lastViewed: DateTime.now(),
            sizeInBytes: int.parse(details[2])));
      } else {
        return right(null);
      }
    } on PlatformException catch (e) {
      log('getPdfFromIntent error: $e');
      return left(const Failure.unexpected());
    }
  }

  Future<void> _copyFileFromUri(Uri uri, File targetFile) async {
    try {
      // Request the file bytes from the Android side, which will return a Uint8List
      final Uint8List? fileBytes = await platform.invokeMethod<Uint8List>(
        'getFileBytesFromUri',
        {'uri': uri.toString()},
      );

      if (fileBytes != null) {
        // Write the bytes to the target file
        await targetFile.writeAsBytes(fileBytes);
      } else {
        log("Failed to get file bytes from URI");
      }
    } catch (e) {
      log("Error copying file: $e");
    }
  }
}
