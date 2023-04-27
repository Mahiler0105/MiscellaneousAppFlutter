import 'package:flutter/material.dart' hide Router;
import 'package:miscellaneous_app/theme/app_theme.dart';
import 'package:miscellaneous_app/theme/theme_observer.dart';
import 'package:provider/provider.dart';
import 'main/app_state.dart';
import 'navigation/router.dart' show Router;

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(AppTheme.lightTheme),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    WidgetsBinding.instance.addObserver(ThemeObserver(themeProvider));

    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      initialRoute: Router.mainRoute,
      title: 'Miscellaneous App',
      theme: themeProvider.getTheme(),
    );
  }
}
