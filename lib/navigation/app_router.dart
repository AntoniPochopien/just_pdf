import 'package:auto_route/auto_route.dart';
import 'package:just_pdf/dashboard/presentation/dashboard_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DashboardRoute.page, initial: true),
      ];
}
