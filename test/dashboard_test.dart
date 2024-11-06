import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_pdf/common/widgets/just_pdf_app_bar.dart';
import 'package:just_pdf/dashboard/domain/i_dashboard_repository.dart';
import 'package:just_pdf/dashboard/domain/options.dart';
import 'package:just_pdf/dashboard/presentation/widgets/file_tile.dart';
import 'package:just_pdf/dashboard/presentation/widgets/option_pill.dart';
import 'package:just_pdf/di.dart';
import 'package:just_pdf/l10n/l10n.dart';
import 'package:just_pdf/local_storage/domain/i_local_storage_repository.dart';

import 'package:just_pdf/main.dart';
import 'package:just_pdf/navigation/app_router.dart';
import 'package:just_pdf/printing/domain/i_printing_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dashboard_test.mocks.dart';
import 'dashboard_test_data.dart';

@GenerateMocks([
  IDashboardRepository,
  ILocalStorageRepository,
  IPrintingRepository,
])
void main() {
  late MockILocalStorageRepository mockILocalStorageRepository;
  late MockIDashboardRepository mockIDashboardRepository;
  late MockIPrintingRepository mockIPrintingRepository;

  setUp(() {
    mockILocalStorageRepository = MockILocalStorageRepository();
    mockIDashboardRepository = MockIDashboardRepository();
    mockIPrintingRepository = MockIPrintingRepository();

    getIt.registerLazySingleton<IDashboardRepository>(
        () => mockIDashboardRepository);
    getIt.registerLazySingleton<ILocalStorageRepository>(
        () => mockILocalStorageRepository);
    getIt.registerLazySingleton<IPrintingRepository>(
        () => mockIPrintingRepository);
    getIt.registerLazySingleton(() => AppRouter());
  });

  tearDown(() {
    getIt.reset();
  });

  testWidgets('Check if appBar is visible', (WidgetTester tester) async {
    when(mockILocalStorageRepository.getFiles()).thenAnswer((_) => dashboardDataFiles);
    when(mockILocalStorageRepository.readLocale())
        .thenAnswer((_) => L10n.supported.first);
    when(mockILocalStorageRepository.getLastOption())
        .thenAnswer((_) => Options.lastSeen);
    when(mockIDashboardRepository.requestStoragePermission())
        .thenAnswer((_) async => true);
    when(mockIDashboardRepository.getPdfFromIntent())
        .thenAnswer((_) async => right(null));

    await tester.pumpWidget(const JustPdf());
    await tester.pumpAndSettle();
    final finder = find.widgetWithText(JustPdfAppBar, 'JustPDF');
    expect(finder, findsOneWidget);
  });

  testWidgets('Check if clicking A-Z, will sort files',
      (WidgetTester tester) async {

    //Make sure that files are not sorted correctly
    dashboardDataFiles.sort((a, b) => b.getName.compareTo(a.getName));

    when(mockILocalStorageRepository.getFiles()).thenAnswer((_) => dashboardDataFiles);
    when(mockILocalStorageRepository.readLocale())
        .thenAnswer((_) => L10n.supported.first);
    when(mockILocalStorageRepository.getLastOption())
        .thenAnswer((_) => Options.lastSeen);
    when(mockIDashboardRepository.requestStoragePermission())
        .thenAnswer((_) async => true);
    when(mockIDashboardRepository.getPdfFromIntent())
        .thenAnswer((_) async => right(null));

    await tester.pumpWidget(const JustPdf());
    await tester.pumpAndSettle();

    final azPillFinder = find.widgetWithText(OptionPill, 'A-Z');
    await tester.tap(azPillFinder);
    await tester.pumpAndSettle();

    final displayedFiles = find.byType(FileTile);

    final firstFile = tester.widget<FileTile>(displayedFiles.at(0));
    final secondFile = tester.widget<FileTile>(displayedFiles.at(1));

    final firstName = firstFile.fileMetadata.getName;
    final secondName = secondFile.fileMetadata.getName;

    expect(firstName.compareTo(secondName) <= 0, isTrue,
        reason: 'Files are not sorted alphabetically');
  });
}
