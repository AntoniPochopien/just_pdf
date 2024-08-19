import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_pdf/common/utils/firebase_analytics.dart';
import 'package:just_pdf/common/utils/firebase_initialization.dart';
import 'package:just_pdf/di.dart';
import 'package:just_pdf/l10n/application/cubit/language_cubit.dart';
import 'package:just_pdf/l10n/l10n.dart';
import 'package:just_pdf/local_storage/domain/i_local_storage_repository.dart';
import 'package:just_pdf/navigation/app_router.dart';

void main() async {
  diInit();
  await Future.wait([
    getIt<ILocalStorageRepository>().init(),
    firebaseInitalization(),
  ]);

  runApp(const JustPdf());
}

class JustPdf extends StatelessWidget {
  const JustPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(
        localStorageRepository: getIt<ILocalStorageRepository>(),
      )..init(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, languageState) => MaterialApp.router(
          routerConfig: getIt<AppRouter>().config(
              navigatorObservers: () => [
                    firebaseAnalyticsObserver,
                    AutoRouteObserver(),
                  ]),
          title: 'Just PDF',
          supportedLocales: L10n.supported,
          localizationsDelegates: L10n.localizationDelegates,
          locale: languageState.locale,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: ZoomPageTransitionsBuilder(
                    allowEnterRouteSnapshotting: false),
                // Uncomment when added iOS support
                // TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
              },
            ),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
