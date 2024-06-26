import 'package:get_it/get_it.dart';
import 'package:just_pdf/dashboard/domain/i_dashboard_repository.dart';
import 'package:just_pdf/dashboard/infrastructure/dashboard_repository.dart';
import 'package:just_pdf/local_storage/domain/i_local_storage_repository.dart';
import 'package:just_pdf/local_storage/infrastructure/local_storage_repository.dart';
import 'package:just_pdf/navigation/app_router.dart';

final getIt = GetIt.instance;

void diInit() {
  getIt.registerLazySingleton(() => AppRouter());
  getIt
      .registerLazySingleton<IDashboardRepository>(() => DashboardRepository());
  getIt.registerLazySingleton<ILocalStorageRepository>(
      () => LocalStorageRepository());
}