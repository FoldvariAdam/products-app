import 'package:flutter/material.dart';
import 'package:products_app/core/themes/app_theme.dart';
import 'package:products_app/core/themes/app_tokens.dart';

class AppThemeFactory {
  AppThemeFactory._();

  static ThemeData create() {
    final scheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppTokens.primaryColor,
      onPrimary: AppTokens.foregroundColor,
      secondary: AppTokens.secondaryColor,
      onSecondary: AppTokens.foregroundColor,
      error: Colors.red,
      onError: AppTokens.foregroundColor,
      surface: AppTokens.componentBackgroundColor,
      onSurface: AppTokens.foregroundColor,
      surfaceContainerHighest: AppTokens.componentBackgroundColor,
      onSurfaceVariant: AppTokens.foregroundColor.withValues(alpha: 0.75),
      outline: AppTokens.borderColor,
    );

    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppTokens.backgroundColor,
    );

    return base.copyWith(
      cardTheme: CardThemeData(
        color: AppTokens.componentBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.r2xl),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTokens.componentBackgroundColor,
          foregroundColor: AppTokens.foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTokens.r2xl),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppTokens.componentBackgroundColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTokens.r2xl),
          borderSide: const BorderSide(color: AppTokens.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTokens.r2xl),
          borderSide: const BorderSide(color: AppTokens.borderColor),
        ),
      ),
      extensions: <ThemeExtension<dynamic>>[
        AppTheme(
          s0: AppTokens.s0,
          s1: AppTokens.s1,
          s2: AppTokens.s2,
          s3: AppTokens.s3,
          s4: AppTokens.s4,
          s5: AppTokens.s5,
          r2xl: BorderRadius.circular(AppTokens.r2xl),
          foregroundColor: AppTokens.foregroundColor,
          backgroundColor: AppTokens.backgroundColor,
          primaryColor: AppTokens.primaryColor,
          secondaryColor: AppTokens.secondaryColor,
          componentBackgroundColor: AppTokens.componentBackgroundColor,
          borderColor: AppTokens.borderColor,
          mutedForegroundColor: AppTokens.mutedForegroundColor,
          headLine: AppTokens.headLine,
          subTitle: AppTokens.subTitle,
          bodyText: AppTokens.bodyText,
          descriptionText: AppTokens.descriptionText,
          metaText: AppTokens.metaText,
        ),
      ],
    );
  }
}

extension AppStyleX on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
}
