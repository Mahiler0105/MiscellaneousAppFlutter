import 'package:flutter/material.dart' hide Router;
import 'package:miscellaneous_app/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);

    // final brightness = MediaQuery.of(context).platformBrightness;
    // var newThemeMode = brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    //
    // final theme = Provider.of<ThemeNotifier>(context);
    // theme.setMode(newThemeMode);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      Icons.light_mode_outlined,
                      color: getIconColorByDarkMode(themeProvider.getTheme().brightness == Brightness.dark, context)
                  ),
                  SizedBox(
                    width: 50,
                    child: Switch(
                      value: themeProvider.getTheme().brightness == Brightness.dark,
                      onChanged: (value){
                        if (value) {
                          themeProvider.setTheme(AppTheme.darkTheme);
                        } else {
                          themeProvider.setTheme(AppTheme.lightTheme);
                        }
                      },
                    ),
                  ),
                  Icon(
                      Icons.dark_mode_outlined,
                      color: getIconColorByDarkMode(!(themeProvider.getTheme().brightness == Brightness.dark), context)
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40), // fromHeight use double.infinity as width and 40 is the height
                  ),
                  child: const Text("IR A INSTAGRAM")),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40), // fromHeight use double.infinity as width and 40 is the height
                  ),
                  child: const Text("IR A TODO APP"))
            ],
          ),
        ),
      ),
    );
  }

  getIconColorByDarkMode(bool isDarkMode, BuildContext context){
    return isDarkMode ? Theme.of(context).colorScheme.background : Theme.of(context).colorScheme.onBackground;
  }
}
