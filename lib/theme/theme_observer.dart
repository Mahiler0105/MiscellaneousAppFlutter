import 'package:flutter/material.dart';
import 'package:miscellaneous_app/theme/app_theme.dart';
import '../main/app_state.dart';

class ThemeObserver extends WidgetsBindingObserver {
  final ThemeProvider themeProvider;

  ThemeObserver(this.themeProvider);

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    final brightness = WidgetsBinding.instance.window.platformBrightness;

    if (brightness == Brightness.dark) {
      themeProvider.setTheme(AppTheme.darkTheme);
    } else {
      themeProvider.setTheme(AppTheme.lightTheme);
    }
  }
}
