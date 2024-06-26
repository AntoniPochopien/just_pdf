import 'package:just_pdf/dashboard/domain/i_dashboard_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class DashboardRepository implements IDashboardRepository {
  @override
  Future<void> requestStoragePermission() async {
    final status = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }
  }
}
