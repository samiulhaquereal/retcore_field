import 'package:flutter/material.dart';

/// RetCoreFieldSizes contains all size and dimension definitions for RetCoreField.
///
/// All sizes are static and can be accessed directly.
/// Modify these values to customize the sizing globally.
abstract class RetCoreFieldSizes {
  // --- Text Sizes ---
  /// Font size for the input text.
  static const double inputTextSize = 16.0;

  /// Font size for the hint text.
  static const double hintTextSize = 14.0;

  /// Font size for the label text.
  static const double labelTextSize = 16.0;

  /// Font size for error messages.
  static const double errorTextSize = 12.0;

  /// Font size for the required asterisk (*).
  static const double requiredAsteriskSize = 16.0;

  // --- Icon Sizes ---
  /// Size for prefix icons.
  static const double prefixIconSize = 22.0;

  /// Size for suffix icons.
  static const double suffixIconSize = 22.0;

  // --- Border Dimensions ---
  /// Border radius for all borders.
  static const double borderRadius = 12.0;

  /// Width of the enabled border.
  static const double borderWidth = 1.0;

  /// Width of the focused border.
  static const double focusedBorderWidth = 2.0;

  /// Width of the error border.
  static const double errorBorderWidth = 1.0;

  // --- Cursor Dimensions ---
  /// Width of the cursor.
  static const double cursorWidth = 2.0;

  /// Height of the cursor (null means auto).
  static const double? cursorHeight = null;

  /// Radius of the cursor corners.
  static const Radius? cursorRadius = null;

  // --- Layout & Spacing ---
  /// Padding inside the text field.
  static const EdgeInsets contentPadding = EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0);

  /// Maximum number of lines for error text.
  static const int errorMaxLines = 2;
}
