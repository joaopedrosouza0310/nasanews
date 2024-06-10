import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core.dart';

abstract class CustomTheme {
  static ThemeData appTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily,
        textTheme: Theme.of(context).textTheme.copyWith(
              displayMedium: const TextStyle(color: AppColors.defaultTextColor),
            ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
        useMaterial3: true,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(AppColors.primaryColor),
        ),
      );
}
