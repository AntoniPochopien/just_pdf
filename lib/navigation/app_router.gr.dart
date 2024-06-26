// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    PdfViewerRoute.name: (routeData) {
      final args = routeData.argsAs<PdfViewerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PdfViewerScreen(
          key: args.key,
          fileMetadata: args.fileMetadata,
        ),
      );
    },
  };
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PdfViewerScreen]
class PdfViewerRoute extends PageRouteInfo<PdfViewerRouteArgs> {
  PdfViewerRoute({
    Key? key,
    required FileMetadata fileMetadata,
    List<PageRouteInfo>? children,
  }) : super(
          PdfViewerRoute.name,
          args: PdfViewerRouteArgs(
            key: key,
            fileMetadata: fileMetadata,
          ),
          initialChildren: children,
        );

  static const String name = 'PdfViewerRoute';

  static const PageInfo<PdfViewerRouteArgs> page =
      PageInfo<PdfViewerRouteArgs>(name);
}

class PdfViewerRouteArgs {
  const PdfViewerRouteArgs({
    this.key,
    required this.fileMetadata,
  });

  final Key? key;

  final FileMetadata fileMetadata;

  @override
  String toString() {
    return 'PdfViewerRouteArgs{key: $key, fileMetadata: $fileMetadata}';
  }
}
