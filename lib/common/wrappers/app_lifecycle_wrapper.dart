import 'package:flutter/widgets.dart';

class AppLifecycleWrapper extends StatefulWidget {
  final Widget child;
  final Function? onResumed;
  const AppLifecycleWrapper({super.key, required this.child, this.onResumed});

  @override
  State<AppLifecycleWrapper> createState() => _AppLifecycleWrapperState();
}

class _AppLifecycleWrapperState extends State<AppLifecycleWrapper>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed && widget.onResumed != null) {
      widget.onResumed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
