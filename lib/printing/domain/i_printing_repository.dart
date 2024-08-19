import 'package:dartz/dartz.dart';
import 'package:just_pdf/common/domain/failure.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';

abstract class IPrintingRepository {

  Future<Either<Failure, Unit>> print(FileMetadata fileMetadata);
  Future<Either<Failure, Unit>> share(FileMetadata fileMetadata);

}