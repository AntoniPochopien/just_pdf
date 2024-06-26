import 'package:flutter/material.dart';
import 'package:just_pdf/di.dart';
import 'package:just_pdf/navigation/app_router.dart';

void main() {
  runApp(const JustPdf());
}

class JustPdf extends StatelessWidget {
  const JustPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getIt<AppRouter>().config(),
      title: 'Just PDF',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
