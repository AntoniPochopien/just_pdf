import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/dashboard/presentation/dashboard_screen.dart';
import 'package:just_pdf/pdf_viewer/pdf_viewer_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DashboardRoute.page, initial: true),
        AutoRoute(page: PdfViewerRoute.page),
      ];
}
