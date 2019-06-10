import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlertService {
  AlertService._(this.context);

  final BuildContext context;
  final MethodChannel _channel = MethodChannel('io.github.jogboms/alert');

  bool get isIos => Theme.of(context).platform == TargetPlatform.iOS;

  static AlertService of(BuildContext context) => AlertService._(context);

  Future<void> alert() async {
    if (isIos) {
      await _channel.invokeMethod<void>('beep');
      await HapticFeedback.vibrate();
    }
  }
}
