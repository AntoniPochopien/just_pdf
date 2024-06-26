import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/local_storage/domain/i_local_storage_repository.dart';
import 'package:hive_flutter/adapters.dart';

class LocalStorageRepository implements ILocalStorageRepository {
  late final Box box;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FileMetadataAdapter());
    box = await Hive.openBox('JustPDF');
  }
}
