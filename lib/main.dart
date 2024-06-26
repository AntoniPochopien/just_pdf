import 'package:flutter/material.dart';
import 'package:just_pdf/di.dart';
import 'package:just_pdf/l10n/l10n.dart';
import 'package:just_pdf/local_storage/domain/i_local_storage_repository.dart';
import 'package:just_pdf/navigation/app_router.dart';

void main() async {
  diInit();
  await getIt<ILocalStorageRepository>().init();
  runApp(const JustPdf());
}

class JustPdf extends StatelessWidget {
  const JustPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getIt<AppRouter>().config(),
      title: 'Just PDF',
      supportedLocales: L10n.supported,
      localizationsDelegates: L10n.localizationDelegates,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
