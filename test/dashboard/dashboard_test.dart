import 'package:dartz/dartz.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_pdf/common/widgets/just_pdf_app_bar.dart';
import 'package:just_pdf/dashboard/domain/i_dashboard_repository.dart';
import 'package:just_pdf/dashboard/domain/options.dart';
import 'package:just_pdf/dashboard/presentation/widgets/file_tile.dart';
import 'package:just_pdf/di.dart';
import 'package:just_pdf/l10n/l10n.dart';
import 'package:just_pdf/local_storage/domain/i_local_storage_repository.dart';

import 'package:just_pdf/main.dart';
import 'package:just_pdf/navigation/app_router.dart';
import 'package:just_pdf/printing/domain/i_printing_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dashboard_test.mocks.dart';
import '../test_data.dart';

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
    when(mockILocalStorageRepository.getFiles())
        .thenAnswer((_) => mockedFiles);
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

  testWidgets('Check if Option *Last Seen*, will sort files',
      (WidgetTester tester) async {
    //Make sure that files are not sorted correctly
    mockedFiles.sort((a, b) => a.lastViewed.compareTo(b.lastViewed));

    when(mockILocalStorageRepository.getFiles())
        .thenAnswer((_) => mockedFiles);
    when(mockILocalStorageRepository.readLocale())
        .thenAnswer((_) => L10n.supported.first);
    when(mockIDashboardRepository.requestStoragePermission())
        .thenAnswer((_) async => true);
    when(mockIDashboardRepository.getPdfFromIntent())
        .thenAnswer((_) async => right(null));

    //Launch last seen pill
    when(mockILocalStorageRepository.getLastOption())
        .thenAnswer((_) => Options.lastSeen);

    await tester.pumpWidget(const JustPdf());
    await tester.pumpAndSettle();

    final displayedFiles = find.byType(FileTile);

    final firstFile = tester.widget<FileTile>(displayedFiles.at(0));
    final secondFile = tester.widget<FileTile>(displayedFiles.at(1));

    final firstDate = firstFile.fileMetadata.lastViewed;
    final secondDate = secondFile.fileMetadata.lastViewed;

    expect(firstDate.compareTo(secondDate) >= 0, isTrue,
        reason: 'Files are not sorted from newest to oldest');
  });

  testWidgets('Check if Option *Alphabetical Order*, will sort files',
      (WidgetTester tester) async {
    //Make sure that files are not sorted correctly
    mockedFiles.sort((a, b) => b.getName.compareTo(a.getName));

    when(mockILocalStorageRepository.getFiles())
        .thenAnswer((_) => mockedFiles);
    when(mockILocalStorageRepository.readLocale())
        .thenAnswer((_) => L10n.supported.first);
    when(mockIDashboardRepository.requestStoragePermission())
        .thenAnswer((_) async => true);
    when(mockIDashboardRepository.getPdfFromIntent())
        .thenAnswer((_) async => right(null));

    //Launch alphabetical order pill
    when(mockILocalStorageRepository.getLastOption())
        .thenAnswer((_) => Options.alphabeticalOrder);

    await tester.pumpWidget(const JustPdf());
    await tester.pumpAndSettle();

    final displayedFiles = find.byType(FileTile);

    final firstFile = tester.widget<FileTile>(displayedFiles.at(0));
    final secondFile = tester.widget<FileTile>(displayedFiles.at(1));

    final firstName = firstFile.fileMetadata.getName;
    final secondName = secondFile.fileMetadata.getName;

    expect(firstName.compareTo(secondName) <= 0, isTrue,
        reason: 'Files are not sorted alphabetically');
  });

  testWidgets('Check if Option *Favorite*, will display only favorite files',
      (WidgetTester tester) async {
    when(mockILocalStorageRepository.getFiles())
        .thenAnswer((_) => mockedFiles);
    when(mockILocalStorageRepository.readLocale())
        .thenAnswer((_) => L10n.supported.first);
    when(mockIDashboardRepository.requestStoragePermission())
        .thenAnswer((_) async => true);
    when(mockIDashboardRepository.getPdfFromIntent())
        .thenAnswer((_) async => right(null));

    //Launch favorite pill
    when(mockILocalStorageRepository.getLastOption())
        .thenAnswer((_) => Options.favorite);

    await tester.pumpWidget(const JustPdf());
    await tester.pumpAndSettle();

    final displayedFiles = find.byType(FileTile).evaluate();

    expect(
      displayedFiles.any((file) {
        final ft = file.widget as FileTile;
        return ft.fileMetadata.favorite;
      }),
      isTrue,
      reason: 'Some files are not marked as favorites',
    );
  });

  testWidgets('Check if tap on file tile, will navigate to pdf viewer',
      (WidgetTester tester) async {
    when(mockILocalStorageRepository.getFiles())
        .thenAnswer((_) => mockedFiles);
    when(mockILocalStorageRepository.readLocale())
        .thenAnswer((_) => L10n.supported.first);
    when(mockIDashboardRepository.requestStoragePermission())
        .thenAnswer((_) async => true);
    when(mockIDashboardRepository.getPdfFromIntent())
        .thenAnswer((_) async => right(null));
    when(mockILocalStorageRepository.getLastOption())
        .thenAnswer((_) => Options.favorite);

    await tester.pumpWidget(const JustPdf());
    await tester.pumpAndSettle();

    final displayedFiles = find.byType(FileTile);

    await tester.tap(displayedFiles.first);
    await tester.pumpAndSettle();

    final pdfViewerFinder = find.byType(PDFView);

    expect(pdfViewerFinder, findsOneWidget, reason: 'can\'t find PDFView');
  });

  testWidgets('Check if app opened by intent, will navigate to pdf viewer',
      (WidgetTester tester) async {
    when(mockILocalStorageRepository.getFiles())
        .thenAnswer((_) => mockedFiles);
    when(mockILocalStorageRepository.readLocale())
        .thenAnswer((_) => L10n.supported.first);
    when(mockIDashboardRepository.requestStoragePermission())
        .thenAnswer((_) async => true);
    when(mockILocalStorageRepository.getLastOption())
        .thenAnswer((_) => Options.favorite);

    //simulate passed file from intent
    when(mockIDashboardRepository.getPdfFromIntent())
        .thenAnswer((_) async => right(mockedFiles.first));

    await tester.pumpWidget(const JustPdf());
    await tester.pumpAndSettle();

    final pdfViewerFinder = find.byType(PDFView);

    expect(pdfViewerFinder, findsOneWidget, reason: 'can\'t find PDFView');
  });
}
