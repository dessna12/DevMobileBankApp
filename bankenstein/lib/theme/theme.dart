import 'package:flutter/material.dart';

// ThemeData lightMode = ThemeData.light(
//   brightness: Brightness.light,
//   primaryColor: const Color.fromARGB(0, 19, 14, 23),
//   primarySwatch: const MaterialColor(
//   0xFF711CCC, // Primary color value
//   <int, Color>{
//     50: Color(0xFFF3E5F5),
//     100: Color(0xFFE1BEE7),
//     200: Color(0xFFCE93D8),
//     300: Color(0xFFBA68C8),
//     400: Color(0xFFAB47BC),
//     500: Color(0xFF9C27B0), // Primary color
//     600: Color(0xFF8E24AA),
//     700: Color(0xFF7B1FA2),
//     800: Color(0xFF6A1B9A),
//     900: Color(0xFF4A148C),
//   },
// ),
//   colorScheme: ColorScheme.light(
//     background: Colors.white,
//     primary: const Color.fromARGB(0, 19, 14, 23),
//     secondary: Colors.grey.shade400,
//   ),
//   useMaterial3: true
//   );

// ThemeData darkMode = ThemeData.dark(
//   brightness: Brightness.dark,
  
//   colorScheme: ColorScheme.dark(
//     background: Colors.grey.shade900,
//     primary: const Color.fromARGB(0, 19, 14, 23),
//     secondary: Colors.grey.shade800,
//   ),
//   useMaterial3: true,
// );

ColorScheme myCustomColorScheme(Color seedColor) {
  // Define a function to generate a color based on the seed color
  Color generateColor(int index) {
    final hue = seedColor.computeLuminance() * 360.0;
    final newHue = (hue + (index * 30)) % 360.0;
    return HSLColor.fromAHSL(1.0, newHue, 0.7, 0.5).toColor();
  }

  // Generate colors for different parts of the color scheme
  final primary = generateColor(0);
  final secondary = generateColor(2);
  final surface = generateColor(4);
  final background = generateColor(5);
  final error = generateColor(6);

  return ColorScheme(
    primary: primary,
    secondary: secondary,
    surface: surface,
    background: background,
    error: error,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light, // or Brightness.dark
  );
}