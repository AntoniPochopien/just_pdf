// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PdfViewerRouteArgs>();
      return PdfViewerScreen(
        key: args.key,
        fileMetadata: args.fileMetadata,
      );
    },
  );
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
