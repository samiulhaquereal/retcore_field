import 'package:flutter/material.dart';

/// RetCoreFieldColors contains all color definitions for RetCoreField.
///
/// All colors are static and can be accessed directly.
/// Modify these values to customize the color scheme globally.
abstract class RetCoreFieldColors {
  // --- Text Colors ---
  /// Color for the input text.
  static Color inputTextColor = Colors.black87;

  /// Color for the hint text.
  static Color hintTextColor = Colors.grey.shade500;

  /// Color for the label text.
  static Color labelTextColor = Colors.grey.shade700;

  /// Color for error messages.
  static const Color errorTextColor = Colors.red;

  /// Color for the required asterisk (*).
  static const Color requiredAsteriskColor = Colors.red;

  // --- Icon Colors ---
  /// Color for prefix icons.
  static Color prefixIconColor = Colors.grey.shade600;

  /// Color for suffix icons.
  static Color suffixIconColor = Colors.grey.shade600;

  // --- Border Colors ---
  /// Color for enabled border.
  static Color borderColor = Colors.grey.shade400;

  /// Color for focused border.
  static const Color focusedBorderColor = Colors.blue;

  /// Color for error border.
  static const Color errorBorderColor = Colors.red;

  /// Color for disabled border.
  static Color disabledBorderColor = Colors.grey.shade300;

  // --- Background Colors ---
  /// Fill color for the field background.
  static const Color fillColor = Colors.transparent;

  // --- Cursor Color ---
  /// Color of the cursor.
  static const Color cursorColor = Colors.blue;
}
