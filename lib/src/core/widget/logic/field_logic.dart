import 'package:retcore_field/src/config/import.dart';
import 'package:retcore_field/src/core/widget/retcore_field_type.dart';

/// A mixin containing helper logic for [RetCoreField] validation and configuration.
mixin RetCoreFieldLogic {
  /// Returns the appropriate keyboard type based on [RetCoreFieldType].
  TextInputType? getKeyboardType(RetCoreFieldType? type, TextInputType? customType) {
    if (customType != null) return customType;
    if (type == null) return null;

    switch (type) {
      case RetCoreFieldType.email:
        return TextInputType.emailAddress;
      case RetCoreFieldType.phone:
        return TextInputType.phone;
      case RetCoreFieldType.url:
        return TextInputType.url;
      case RetCoreFieldType.number:
        return const TextInputType.numberWithOptions(
          decimal: true,
          signed: true,
        );
      case RetCoreFieldType.text:
        return TextInputType.text;
    }
  }

  /// Returns a merged validator based on field type and custom validator logic.
  FormFieldValidator<String> getValidator({
    required bool isRequired,
    required String? labelText,
    required RetCoreFieldType? type,
    required FormFieldValidator<String>? customValidator,
  }) {
    return (value) {
      // 1. Check required
      if (isRequired && (value == null || value.isEmpty)) {
        return '${labelText ?? "Field"} is required';
      }

      // 2. Type-based validation (only if not empty)
      if (value != null && value.isNotEmpty && type != null) {
        switch (type) {
          case RetCoreFieldType.email:
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Enter a valid email address';
            }
          case RetCoreFieldType.url:
            if (!RegExp(r'^https?://[\w\-]+(\.[\w\-]+)+[/#?]?.*$')
                .hasMatch(value)) {
              return 'Enter a valid URL (starting with http/https)';
            }
          case RetCoreFieldType.phone:
            if (!RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
              return 'Enter a valid phone number';
            }
          case RetCoreFieldType.number:
            if (double.tryParse(value) == null) {
              return 'Enter a valid number';
            }
          case RetCoreFieldType.text:
            break;
        }
      }

      // 3. Custom validator
      return customValidator?.call(value);
    };
  }
}
