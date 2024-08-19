import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class RouteAwareWrapper extends StatefulWidget {
  final Widget child;
  final Function? onDidPopNext;
  const RouteAwareWrapper({super.key, required this.child, this.onDidPopNext});

  @override
  State<RouteAwareWrapper> createState() => _RouteAwareWrapperState();
}

class _RouteAwareWrapperState extends State<RouteAwareWrapper> with AutoRouteAware {
  late final AutoRouteObserver? _observer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _observer =
        RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();
    if (_observer != null) {
      _observer.subscribe(this, context.routeData);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (_observer != null) {
      _observer.unsubscribe(this);
    }
  }

  @override
  void didPopNext() {
    super.didPopNext();
    if(widget.onDidPopNext != null){
      widget.onDidPopNext!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}