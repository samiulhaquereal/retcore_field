import 'package:retcore_field/src/config/import.dart';

/// RetCoreTextField is a highly customizable and reusable text input widget.
///
/// It builds upon Flutter's `TextFormField` and provides a clean, theme-based
/// approach to styling. It includes built-in support for password fields,
/// date pickers, and conditional validation, making it a versatile component
/// for any form.
class RetCoreTextField extends StatefulWidget {
  // --- Core Properties ---
  /// Controls the text being edited.
  final TextEditingController? controller;
  /// An optional focus node to manage the field's focus state.
  final FocusNode? focusNode;

  // --- Text and Labels ---
  /// The text that appears in the floating label when the field is focused or contains text.
  final String? labelText;
  /// Hint text to display when the field is empty.
  final String? hintText;

  // --- Behavior Flags ---
  /// If `true`, configures the field for password entry with a visibility toggle.
  final bool isPassword;
  /// If `true`, configures the field as a date picker, showing a calendar icon.
  final bool isDatePicker;
  /// If `true`, marks the field as required and enables validation.
  final bool isRequired;

  // --- Input Configuration ---
  /// The type of keyboard to display for text input.
  final TextInputType? keyboardType;
  /// If `false`, the user cannot interact with the text field.
  final bool enabled;
  /// If `true`, the user cannot modify the text field's content.
  final bool readOnly;
  /// The maximum number of characters allowed in the text field.
  final int? maxLength;
  /// The maximum number of lines the field can expand to. Defaults to 1.
  final int maxLines;

  // --- Validation and Callbacks ---
  /// A function that validates the input. Returns an error string or `null` if valid.
  /// This is only active when [isRequired] is `true`.
  final String? Function(String?)? validator;
  /// A callback that fires whenever the text content changes.
  final void Function(String)? onChanged;

  // --- Theming and Icons ---
  /// The visual theme for styling the text field, including colors, borders, and text styles.
  final RetCoreFieldTheme theme;
  /// An icon to display before the input text.
  final IconData? prefixIcon;
  /// An icon to display after the input text. Not used if `isPassword` or `isDatePicker` is `true`.
  final IconData? suffixIcon;

  // --- Date Picker Configuration ---
  /// The initially selected date for the date picker.
  final DateTime? initialDate;
  /// The earliest date that can be selected in the date picker.
  final DateTime? startingDate;
  /// The latest date that can be selected in the date picker.
  final DateTime? endingDate;

  /// Creates a new instance of RetCoreTextField.
  const RetCoreTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.isPassword = false,
    this.isDatePicker = false,
    this.isRequired = false,
    this.keyboardType,
    this.enabled = true,
    this.readOnly = false,
    this.maxLength,
    this.maxLines = 1,
    this.validator,
    this.onChanged,
    required this.theme,
    this.prefixIcon,
    this.suffixIcon,
    this.initialDate,
    this.startingDate,
    this.endingDate,
  });

  @override
  State<RetCoreTextField> createState() => _RetCoreTextFieldState();
}

class _RetCoreTextFieldState extends State<RetCoreTextField> {
  // Internal state to manage password visibility.
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    // Initialize password obscurity based on the widget's property.
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    // TextFormField is used to get validation and form integration capabilities.
    return TextFormField(
      // --- Core Configuration ---
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      style: widget.theme.inputTextStyle,

      // --- Behavior Configuration ---
      obscureText: _obscureText, // Controls password visibility.
      enabled: widget.enabled,
      readOnly: widget.readOnly || widget.isDatePicker, // Date pickers are often read-only.
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      autocorrect: false, // Disable autocorrect for fields like emails or codes.
      enableSuggestions: false, // Disable suggestions for cleaner input.

      // --- Callbacks and Validation ---
      onChanged: widget.onChanged,
      validator: widget.isRequired ? widget.validator : null, // Apply validator only if required.
      onTapOutside: (event) => FocusScope.of(context).unfocus(), // Dismiss keyboard on outside tap.

      // --- Decoration and Styling ---
      decoration: InputDecoration(
        // Use a dense layout to reduce vertical space, common in forms.
        isDense: true,
        // Set the padding within the text field's bounds.
        contentPadding: widget.theme.contentPadding,
        // The main label, which shows an asterisk if the field is required.
        label: _buildLabel(),
        // Placeholder text shown when the field is empty.
        hintText: widget.hintText,
        hintStyle: widget.theme.hintTextStyle,
        // Error text styling.
        errorStyle: widget.theme.errorTextStyle,
        // Icon shown at the beginning of the field.
        prefixIcon: _buildPrefixIcon(),
        // Icon shown at the end, handling password and date picker icons.
        suffixIcon: _buildSuffixIcon(),
        // Define the appearance of the field's border in different states.
        enabledBorder: _buildBorder(widget.theme.borderColor ?? Colors.grey),
        focusedBorder: _buildBorder(widget.theme.focusedBorderColor ?? Theme.of(context).primaryColor),
        errorBorder: _buildBorder(widget.theme.errorBorderColor ?? Colors.red),
        focusedErrorBorder: _buildBorder(widget.theme.errorBorderColor ?? Colors.red),
      ),
    );
  }

  /// Builds the label as a `RichText` widget to conditionally add a red asterisk.
  Widget? _buildLabel() {
    if (widget.labelText == null) return null;

    // Use RichText to combine the label with a styled asterisk.
    return RichText(
      text: TextSpan(
        text: widget.labelText,
        // Use the theme's label style or fall back to the app's default.
        style: widget.theme.labelTextStyle ?? Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade700),
        children: <TextSpan>[
          // Add a red asterisk if the field is marked as required.
          if (widget.isRequired)
            TextSpan(
              text: ' *',
              style: TextStyle(color: Colors.red.shade700, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }

  /// Builds the prefix icon widget.
  Widget? _buildPrefixIcon() {
    // Only build the icon if one has been provided.
    return widget.prefixIcon != null
        ? Icon(widget.prefixIcon, color: widget.theme.iconColor, size: widget.theme.iconSize)
        : null;
  }

  /// Builds the suffix icon, prioritizing password and date picker icons.
  Widget? _buildSuffixIcon() {
    // If it's a password field, show the visibility toggle icon.
    if (widget.isPassword) {
      return IconButton(
        icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
        color: widget.theme.iconColor,
        onPressed: () => setState(() => _obscureText = !_obscureText),
      );
    }
    // If it's a date picker, show the calendar icon.
    if (widget.isDatePicker) {
      return IconButton(
        icon: Icon(widget.suffixIcon ?? Icons.calendar_today, color: widget.theme.iconColor, size: widget.theme.iconSize),
        onPressed: _pickDate,
      );
    }
    // Otherwise, show the generic suffix icon if provided.
    if (widget.suffixIcon != null) {
      return Icon(widget.suffixIcon, color: widget.theme.iconColor, size: widget.theme.iconSize);
    }
    // Return null if no suffix icon is needed.
    return null;
  }

  /// Helper method to create a consistent `OutlineInputBorder` with a given color.
  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      // Use the border radius from the theme or a default value.
      borderRadius: BorderRadius.circular(widget.theme.borderRadius ?? 8.0),
      // Set the border color.
      borderSide: BorderSide(color: color),
    );
  }

  /// Displays the date picker dialog and updates the controller with the selected date.
  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: widget.startingDate ?? DateTime(1900),
      lastDate: widget.endingDate ?? DateTime(2100),
    );

    // If a date was selected, format it and update the text field.
    if (pickedDate != null) {
      // Format the date to YYYY-MM-DD for consistency.
      final formattedDate = "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      // Update the controller's text, which rebuilds the UI.
      widget.controller?.text = formattedDate;
      // Also fire the onChanged callback for external listeners.
      widget.onChanged?.call(formattedDate);
    }
  }
}
