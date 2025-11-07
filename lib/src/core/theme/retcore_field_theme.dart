import 'package:retcore_field/src/config/import.dart';

/// RetCoreFieldTheme defines the visual styling for RetCoreField.
///
/// This theme uses static colors and sizes from RetCoreFieldColors and RetCoreFieldSizes.
/// You can override specific properties through the constructor or use copyWith.
class RetCoreFieldTheme {
  // --- Text Styles ---
  final TextStyle? inputTextStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? errorTextStyle;
  final TextStyle? requiredAsteriskStyle;

  // --- Icon Styling ---
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final Color? suffixIconColor;
  final double? suffixIconSize;

  // --- Borders ---
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? border;

  // --- Border Properties ---
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final double? borderRadius;

  // --- Background ---
  final bool filled;
  final Color? fillColor;

  // --- Cursor ---
  final Color? cursorColor;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;

  // --- Layout ---
  final bool isDense;
  final EdgeInsets? contentPadding;
  final int? errorMaxLines;

  /// Creates a theme for RetCoreField.
  const RetCoreFieldTheme({
    this.inputTextStyle,
    this.hintTextStyle,
    this.labelTextStyle,
    this.errorTextStyle,
    this.requiredAsteriskStyle,
    this.prefixIconColor,
    this.prefixIconSize,
    this.suffixIconColor,
    this.suffixIconSize,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.border,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.borderRadius,
    this.filled = false,
    this.fillColor,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.isDense = true,
    this.contentPadding,
    this.errorMaxLines,
  });

  /// Creates a copy with the given fields replaced.
  RetCoreFieldTheme copyWith({
    TextStyle? inputTextStyle,
    TextStyle? hintTextStyle,
    TextStyle? labelTextStyle,
    TextStyle? errorTextStyle,
    TextStyle? requiredAsteriskStyle,
    Color? prefixIconColor,
    double? prefixIconSize,
    Color? suffixIconColor,
    double? suffixIconSize,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
    InputBorder? disabledBorder,
    InputBorder? border,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    double? borderRadius,
    bool? filled,
    Color? fillColor,
    Color? cursorColor,
    double? cursorWidth,
    double? cursorHeight,
    Radius? cursorRadius,
    bool? isDense,
    EdgeInsets? contentPadding,
    int? errorMaxLines,
  }) {
    return RetCoreFieldTheme(
      inputTextStyle: inputTextStyle ?? this.inputTextStyle,
      hintTextStyle: hintTextStyle ?? this.hintTextStyle,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      errorTextStyle: errorTextStyle ?? this.errorTextStyle,
      requiredAsteriskStyle:
          requiredAsteriskStyle ?? this.requiredAsteriskStyle,
      prefixIconColor: prefixIconColor ?? this.prefixIconColor,
      prefixIconSize: prefixIconSize ?? this.prefixIconSize,
      suffixIconColor: suffixIconColor ?? this.suffixIconColor,
      suffixIconSize: suffixIconSize ?? this.suffixIconSize,
      enabledBorder: enabledBorder ?? this.enabledBorder,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      errorBorder: errorBorder ?? this.errorBorder,
      focusedErrorBorder: focusedErrorBorder ?? this.focusedErrorBorder,
      disabledBorder: disabledBorder ?? this.disabledBorder,
      border: border ?? this.border,
      borderColor: borderColor ?? this.borderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      filled: filled ?? this.filled,
      fillColor: fillColor ?? this.fillColor,
      cursorColor: cursorColor ?? this.cursorColor,
      cursorWidth: cursorWidth ?? this.cursorWidth,
      cursorHeight: cursorHeight ?? this.cursorHeight,
      cursorRadius: cursorRadius ?? this.cursorRadius,
      isDense: isDense ?? this.isDense,
      contentPadding: contentPadding ?? this.contentPadding,
      errorMaxLines: errorMaxLines ?? this.errorMaxLines,
    );
  }

  /// Creates a default theme using static colors and sizes.
  factory RetCoreFieldTheme.defaultTheme() {
    return RetCoreFieldTheme(
      // Text styles using static values
      inputTextStyle: TextStyle(
        fontSize: RetCoreFieldSizes.inputTextSize,
        color: RetCoreFieldColors.inputTextColor,
      ),
      hintTextStyle: TextStyle(
        fontSize: RetCoreFieldSizes.hintTextSize,
        color: RetCoreFieldColors.hintTextColor,
      ),
      labelTextStyle: TextStyle(
        fontSize: RetCoreFieldSizes.labelTextSize,
        color: RetCoreFieldColors.labelTextColor,
      ),
      errorTextStyle: const TextStyle(
        fontSize: RetCoreFieldSizes.errorTextSize,
        color: RetCoreFieldColors.errorTextColor,
      ),
      requiredAsteriskStyle: const TextStyle(
        fontSize: RetCoreFieldSizes.requiredAsteriskSize,
        color: RetCoreFieldColors.requiredAsteriskColor,
        fontWeight: FontWeight.bold,
      ),

      // Icon styling
      prefixIconColor: RetCoreFieldColors.prefixIconColor,
      prefixIconSize: RetCoreFieldSizes.prefixIconSize,
      suffixIconColor: RetCoreFieldColors.suffixIconColor,
      suffixIconSize: RetCoreFieldSizes.suffixIconSize,

      // Borders
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RetCoreFieldSizes.borderRadius),
        borderSide: BorderSide(
          color: RetCoreFieldColors.borderColor,
          width: RetCoreFieldSizes.borderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RetCoreFieldSizes.borderRadius),
        borderSide: const BorderSide(
          color: RetCoreFieldColors.focusedBorderColor,
          width: RetCoreFieldSizes.focusedBorderWidth,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RetCoreFieldSizes.borderRadius),
        borderSide: const BorderSide(
          color: RetCoreFieldColors.errorBorderColor,
          width: RetCoreFieldSizes.errorBorderWidth,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RetCoreFieldSizes.borderRadius),
        borderSide: const BorderSide(
          color: RetCoreFieldColors.errorBorderColor,
          width: RetCoreFieldSizes.focusedBorderWidth,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RetCoreFieldSizes.borderRadius),
        borderSide: BorderSide(
          color: RetCoreFieldColors.disabledBorderColor,
          width: RetCoreFieldSizes.borderWidth,
        ),
      ),

      // Border properties
      borderRadius: RetCoreFieldSizes.borderRadius,

      // Cursor
      cursorColor: RetCoreFieldColors.cursorColor,
      cursorWidth: RetCoreFieldSizes.cursorWidth,
      cursorHeight: RetCoreFieldSizes.cursorHeight,
      cursorRadius: RetCoreFieldSizes.cursorRadius,

      // Layout
      isDense: true,
      contentPadding: RetCoreFieldSizes.contentPadding,
      errorMaxLines: RetCoreFieldSizes.errorMaxLines,
    );
  }
}
