import 'package:flutter/material.dart';

/// Central place for tiny UI constants used across widgets.
/// Keep this minimal to avoid broad churn; only used by newly extracted widgets.
class UiConstants {
  // Spacing
  static const double spacingXS = 8.0;
  static const double spacingS = 12.0;
  static const double spacingM = 16.0;
  static const double spacingL = 20.0;
  static const double spacingXL = 24.0;
  static const double spacing2XL = 28.0;

  // Radii
  static const BorderRadius radiusS = BorderRadius.all(Radius.circular(12));
  static const BorderRadius radiusM = BorderRadius.all(Radius.circular(18));
  static const BorderRadius radiusL = BorderRadius.all(Radius.circular(24));
  static const BorderRadius radiusSheet = BorderRadius.vertical(top: Radius.circular(32));

  // Durations
  static const Duration animFast = Duration(milliseconds: 150);

  // Button sizes
  static const Size minButtonSize = Size(double.infinity, 54);
}
