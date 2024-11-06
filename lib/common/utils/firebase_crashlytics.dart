import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

final firebaseCrashlyticsInstance = FirebaseCrashlytics.instance;

Future<void> reportError(
    {required dynamic exception,
    required dynamic reason,
    StackTrace? stack}) async {
  if (kDebugMode) {
    await firebaseCrashlyticsInstance.setCrashlyticsCollectionEnabled(false);
  }
  FirebaseCrashlytics.instance
      .recordError(exception, stack, reason: reason, fatal: false);
}
