import 'package:just_pdf/common/utils/firebase_crashlytics.dart';
import 'package:just_pdf/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future<void> firebaseInitalization() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (kDebugMode) {
    await firebaseCrashlyticsInstance.setCrashlyticsCollectionEnabled(false);
  }
  FlutterError.onError = (errorDetails) {
    firebaseCrashlyticsInstance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    firebaseCrashlyticsInstance.recordError(error, stack, fatal: true);
    return true;
  };
}
