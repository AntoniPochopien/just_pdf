import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';

final FirebaseAnalytics firebaseAnalyticsInstance = FirebaseAnalytics.instance;
final firebaseAnalyticsObserver =
    FirebaseAnalyticsObserver(analytics: firebaseAnalyticsInstance);

Future<void> logCustomEvent(String name,
    [Map<String, Object>? parameter]) async {
  try {
    await firebaseAnalyticsInstance.logEvent(name: name, parameters: parameter);
  } catch (e) {
    log('analytics event not logged, reason: $e');
  }
}
