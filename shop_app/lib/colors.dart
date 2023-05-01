import "package:flutter/material.dart";

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFE5E6E8),
  100: Color(0xFFBDC1C5),
  200: Color(0xFF91979F),
  300: Color(0xFF656D78),
  400: Color(0xFF444E5B),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF1F2A38),
  700: Color(0xFF1A2330),
  800: Color(0xFF151D28),
  900: Color(0xFF0C121B),
});
const int _primaryPrimaryValue = 0xFF232F3E;

const MaterialColor primaryAccent =
    MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFF5D98FF),
  200: Color(_primaryAccentValue),
  400: Color(0xFF0059F6),
  700: Color(0xFF0050DC),
});
const int _primaryAccentValue = 0xFF2A77FF;
