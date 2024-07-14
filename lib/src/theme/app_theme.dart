import 'package:dfa_media_example/src/constants/app_fonts.dart';
import 'package:dfa_media_example/src/constants/palette.dart';
import 'package:flutter/material.dart';

part 'widgets_theme/app_bar.dart';

part 'widgets_theme/bottom_navigation_bar.dart';

part 'textstyles_theme/text_theme.dart';

const primaryColor = Palette.colorF2F3F8;
ThemeData appTheme() => ThemeData(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: primaryColor,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: primaryColor,
      appBarTheme: _appBarTheme,
      bottomNavigationBarTheme: _bottomNavigationBarTheme,
      textTheme: _textTheme,
    );
