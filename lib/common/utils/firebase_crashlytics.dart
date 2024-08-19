import 'package:firebase_crashlytics/firebase_crashlytics.dart';

final firebaseCrashlyticsInstance = FirebaseCrashlytics.instance;

Future<void> reportError(
        {required dynamic exception,
        required dynamic reason,
        StackTrace? stack}) =>
    FirebaseCrashlytics.instance
        .recordError(exception, stack, reason: reason, fatal: false);
