import 'package:flutter/widgets.dart';

class AppLifecycleListener {
  final VoidCallback? onDetach;
  final VoidCallback? onHide;
  final VoidCallback? onInactive;
  final VoidCallback? onPause;
  final VoidCallback? onRestart;
  final VoidCallback? onResume;
  final VoidCallback? onShow;

  AppLifecycleListener({
    this.onDetach,
    this.onHide,
    this.onInactive,
    this.onPause,
    this.onRestart,
    this.onResume,
    this.onShow,
  }) {
    WidgetsBinding.instance.addObserver(_AppLifecycleObserver(this));
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(_AppLifecycleObserver(this));
  }
}

class _AppLifecycleObserver extends WidgetsBindingObserver {
  final AppLifecycleListener listener;

  _AppLifecycleObserver(this.listener);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        listener.onDetach?.call();
      case AppLifecycleState.paused:
        listener.onPause?.call();
      case AppLifecycleState.inactive:
        listener.onInactive?.call();
      case AppLifecycleState.resumed:
        listener.onResume?.call();
      case AppLifecycleState.hidden:
        listener.onHide?.call();
    }
  }
}
