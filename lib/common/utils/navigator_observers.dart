import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_pdf/common/utils/firebase_analytics.dart';

List<NavigatorObserver> navigatorObservers() {
  final observers = <NavigatorObserver>[
    AutoRouteObserver(),
  ];
  if (!kDebugMode) {
    observers.add(firebaseAnalyticsObserver);
  }
  return observers;
}
