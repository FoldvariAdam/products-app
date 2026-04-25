import 'package:flutter/material.dart';

class AppTokens {
  // --- Colors ---
  static const Color foregroundColor = Color(0xFF111827);
  static const Color backgroundColor = Color(0xFFF8F9FB);

  static const Color primaryColor = Color(0xFF2F6F6D);
  static const Color secondaryColor = Color(0xFF9EC6C3);

  static const Color mutedForegroundColor = Color(0xFF6B7280);
  static const Color borderColor = Color(0xFFE5E7EB);

  static const Color componentBackgroundColor = Color(0xFFFFFFFF);

  // --- Spacing ---
  static const double s0 = 5;
  static const double s1 = 10;
  static const double s2 = 15;
  static const double s3 = 20;
  static const double s4 = 25;
  static const double s5 = 30;

  // --- Radius ---
  static const double r2xl = 24;

  // --- Text styles ---
  static const TextStyle headLine = TextStyle(
    color: foregroundColor,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle subTitle = TextStyle(
    color: AppTokens.mutedForegroundColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyText = TextStyle(
    color: foregroundColor,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle descriptionText = TextStyle(
    color: mutedForegroundColor,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle metaText = TextStyle(
    color: foregroundColor,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
}
