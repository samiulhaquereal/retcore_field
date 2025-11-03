import 'package:retcore_field/src/config/import.dart';

/// A class to define the visual theme of the RetCoreTextField.
///
/// This allows for consistent styling across the app and easy customization
/// through the [copyWith] method.
class RetCoreFieldTheme {
  final TextStyle? inputTextStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? errorTextStyle;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? iconColor;
  final double? borderRadius;
  final double? iconSize;
  final EdgeInsets? contentPadding;

  /// Creates a theme for the [RetCoreTextField].
  const RetCoreFieldTheme({
    this.inputTextStyle,
    this.hintTextStyle,
    this.labelTextStyle,
    this.errorTextStyle,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.iconColor,
    this.borderRadius,
    this.iconSize,
    this.contentPadding,
  });

  /// Creates a copy of this theme but with the given fields replaced with new values.
  RetCoreFieldTheme copyWith({
    TextStyle? inputTextStyle,
    TextStyle? hintTextStyle,
    TextStyle? labelTextStyle,
    TextStyle? errorTextStyle,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    Color? iconColor,
    double? borderRadius,
    double? iconSize,
    EdgeInsets? contentPadding,
  }) {
    return RetCoreFieldTheme(
      inputTextStyle: inputTextStyle ?? this.inputTextStyle,
      hintTextStyle: hintTextStyle ?? this.hintTextStyle,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      errorTextStyle: errorTextStyle ?? this.errorTextStyle,
      borderColor: borderColor ?? this.borderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      iconColor: iconColor ?? this.iconColor,
      borderRadius: borderRadius ?? this.borderRadius,
      iconSize: iconSize ?? this.iconSize,
      contentPadding: contentPadding ?? this.contentPadding,
    );
  }
}
