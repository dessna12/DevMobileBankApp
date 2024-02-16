import 'package:flutter/material.dart';

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