import 'package:bankenstein/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    // Determine whether dark mode is enabled based on platform brightness
    final Brightness brightnessValue = MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;
    
    return MaterialApp.router(
      title: 'Bankeinstein',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(0, 19, 14, 23)),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}

