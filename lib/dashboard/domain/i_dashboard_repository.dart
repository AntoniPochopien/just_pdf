import 'package:dartz/dartz.dart';
import 'package:just_pdf/common/domain/failure.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';

abstract class IDashboardRepository {
  Future<bool> requestStoragePermission();
  Future<bool> checkStoragePermission();
   Future<Either<Failure, FileMetadata>> getPdfFromIntent();
}
