import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_pdf/dashboard/domain/i_dashboard_repository.dart';
import 'package:just_pdf/dashboard/domain/options.dart';
import 'package:just_pdf/di.dart';
import 'package:just_pdf/local_storage/domain/i_local_storage_repository.dart';
import 'package:just_pdf/main.dart';
import 'package:just_pdf/navigation/app_router.dart';
import 'package:just_pdf/printing/domain/i_printing_repository.dart';
import 'package:mockito/mockito.dart';

import '../dashboard/dashboard_test.mocks.dart';
import '../test_data.dart';

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

  testWidgets('Check if language is changed from pl to en',
      (WidgetTester tester) async {
    when(mockILocalStorageRepository.getFiles())
        .thenAnswer((_) => mockedFiles);
    when(mockILocalStorageRepository.getLastOption())
        .thenAnswer((_) => Options.lastSeen);
    when(mockIDashboardRepository.requestStoragePermission())
        .thenAnswer((_) async => true);
    when(mockIDashboardRepository.getPdfFromIntent())
        .thenAnswer((_) async => right(null));

    //Set initial language as pl
    when(mockILocalStorageRepository.readLocale())
        .thenAnswer((_) => const Locale('pl'));

    await tester.pumpWidget(const JustPdf());
    await tester.pumpAndSettle();

    expect(find.text('Ostatnio przeglądane'), findsOneWidget,
        reason: 'Couldn\'t find pl text');

    final languageBtnFinder = find.byIcon(Icons.language);

    await tester.tap(languageBtnFinder);
    await tester.pumpAndSettle();

    final enLanguageTileFinder = find.text('English');

    await tester.tap(enLanguageTileFinder);
    await tester.pumpAndSettle();

    expect(find.text('Recently viewed'), findsOneWidget, reason: 'Language didnt changed / can\'t find text');
  });
}
