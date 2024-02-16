import 'package:bankenstein/router/router.dart';
import 'package:bankenstein/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      
  return AdaptiveTheme(
    light: ThemeData.light().copyWith(
      colorScheme: myCustomColorScheme(const Color(0xFF130E17)),
    ),
    dark: ThemeData.dark(),
    initial: AdaptiveThemeMode.light,
    builder: (theme, darkTheme) => MaterialApp.router(
        title: 'Bankeinstein',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(0, 19, 14, 23)),
        //   useMaterial3: true,
        // ),
        routerConfig: AppRouter.router,
      )
    );
  }
}

