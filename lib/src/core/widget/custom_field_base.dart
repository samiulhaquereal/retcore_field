import 'package:retcore_field/src/config/import.dart';

/// RetCoreField is a highly customizable and reusable text input widget.
///
/// It builds upon Flutter's `TextFormField` and provides a clean, theme-based
/// approach to styling. ALL visual styling is controlled through the [theme]
/// parameter, ensuring consistent design across your app.
///
/// It includes built-in support for password fields, date pickers, and
/// conditional validation, making it a versatile component for any form.
class RetCoreField extends StatefulWidget {
  // --- Core Properties ---
  /// Controls the text being edited.
  final TextEditingController? controller;

  /// The initial value to display. Cannot be used with `controller`.
  final String? initialValue;

  /// An optional focus node to manage the field's focus state.
  final FocusNode? focusNode;

  // --- Text Content ---
  /// The text that appears in the floating label.
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

  /// The type of action button on the keyboard.
  final TextInputAction? textInputAction;

  /// Configures how to capitalize text.
  final TextCapitalization textCapitalization;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// Whether this text field should focus itself automatically.
  final bool autofocus;

  /// If `false`, the user cannot modify the text field's content.
  final bool readOnly;

  /// If `false`, the user cannot interact with the text field.
  final bool? enabled;

  /// The maximum number of characters allowed.
  final int? maxLength;

  /// Determines how the `maxLength` limit should be enforced.
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// The maximum number of lines the field can expand to.
  final int? maxLines;

  /// The minimum number of lines to occupy.
  final int? minLines;

  /// Whether to enable autocorrect.
  final bool autocorrect;

  /// Whether to show suggestions to the user.
  final bool enableSuggestions;

  // --- Validation and Callbacks ---
  /// A function that validates the input. Only active when [isRequired] is `true`.
  final FormFieldValidator<String>? validator;

  /// A callback that fires when the form is saved.
  final FormFieldSetter<String>? onSaved;

  /// Used to enable and configure auto-validation.
  final AutovalidateMode? autovalidateMode;

  /// A callback that fires whenever the text content changes.
  final ValueChanged<String>? onChanged;

  /// Called when the user taps on this text field.
  final GestureTapCallback? onTap;

  /// Called when a tap is detected outside of the text field.
  final TapRegionCallback? onTapOutside;

  /// Called when the user signals that they are done editing.
  final VoidCallback? onEditingComplete;

  /// Called when the user submits the field.
  final ValueChanged<String>? onFieldSubmitted;

  // --- Input Formatters ---
  /// Optional list of input formatters to restrict or format input.
  final List<TextInputFormatter>? inputFormatters;

  // --- Theming (REQUIRED) ---
  /// The visual theme for styling the text field.
  /// This controls ALL visual aspects: colors, sizes, borders, icons, etc.
  final RetCoreFieldTheme theme;

  // --- Icons (Logical, not styled) ---
  /// An icon to display before the input text.
  final IconData? prefixIcon;

  /// An icon to display after the input text.
  /// Not used if `isPassword` or `isDatePicker` is `true`.
  final IconData? suffixIcon;

  // --- Date Picker Configuration ---
  /// The initially selected date for the date picker.
  final DateTime? initialDate;

  /// The earliest date that can be selected in the date picker.
  final DateTime? startingDate;

  /// The latest date that can be selected in the date picker.
  final DateTime? endingDate;

  // --- Advanced TextFormField Properties ---
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final EdgeInsets scrollPadding;
  final Iterable<String>? autofillHints;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;

  /// Creates a new instance of RetCoreField.
  const RetCoreField({
    super.key,
    // --- REQUIRED: Theme ---
    required this.theme,

    // --- Custom Properties ---
    this.labelText,
    this.hintText,
    this.isPassword = false,
    this.isDatePicker = false,
    this.isRequired = false,
    this.prefixIcon,
    this.suffixIcon,
    this.initialDate,
    this.startingDate,
    this.endingDate,

    // --- Core TextFormField ---
    this.controller,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.autofocus = false,
    this.autocorrect = false,
    this.enableSuggestions = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.maxLengthEnforcement,
    this.enabled,

    // --- Callbacks ---
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,

    // --- Other ---
    this.inputFormatters,
    this.autovalidateMode,
    this.scrollController,
    this.scrollPhysics,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.autofillHints,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
  }) : assert(
         initialValue == null || controller == null,
         'Cannot provide both an initialValue and a controller.',
       ),
       assert(maxLines == null || maxLines > 0);

  @override
  State<RetCoreField> createState() => _RetCoreFieldState();
}

class _RetCoreFieldState extends State<RetCoreField> {
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
    return TextFormField(
      // --- Core Configuration ---
      controller: widget.controller,
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      textAlign: widget.textAlign,
      autofocus: widget.autofocus,
      scrollController: widget.scrollController,
      scrollPhysics: widget.scrollPhysics,

      // --- Behavior Configuration ---
      obscureText: _obscureText,
      readOnly: widget.readOnly || widget.isDatePicker,
      autocorrect: widget.autocorrect,
      enableSuggestions: widget.enableSuggestions,
      maxLength: widget.maxLength,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      minLines: widget.minLines,
      enabled: widget.enabled,

      // --- Styling (from theme) ---
      style: widget.theme.inputTextStyle,
      cursorColor: widget.theme.cursorColor,
      cursorWidth: widget.theme.cursorWidth,
      cursorHeight: widget.theme.cursorHeight,
      cursorRadius: widget.theme.cursorRadius,

      // --- Callbacks and Validation ---
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onTapOutside:
          widget.onTapOutside ?? (event) => FocusScope.of(context).unfocus(),
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      validator: widget.isRequired ? widget.validator : null,
      inputFormatters: widget.inputFormatters,
      autovalidateMode: widget.autovalidateMode,

      // --- Other Properties ---
      scrollPadding: widget.scrollPadding,
      autofillHints: widget.autofillHints,
      restorationId: widget.restorationId,
      enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,

      // --- Decoration (ALL styling from theme) ---
      decoration: InputDecoration(
        isDense: widget.theme.isDense,
        contentPadding: widget.theme.contentPadding,
        filled: widget.theme.filled,
        fillColor: widget.theme.fillColor,

        // Label with asterisk if required
        label: _buildLabel(),
        labelStyle: widget.theme.labelTextStyle,

        // Hint text
        hintText: widget.hintText,
        hintStyle: widget.theme.hintTextStyle,

        // Error styling
        errorStyle: widget.theme.errorTextStyle,
        errorMaxLines: widget.theme.errorMaxLines,

        // Icons
        prefixIcon: _buildPrefixIcon(),
        suffixIcon: _buildSuffixIcon(),

        // Borders
        enabledBorder: widget.theme.enabledBorder,
        focusedBorder: widget.theme.focusedBorder,
        errorBorder: widget.theme.errorBorder,
        focusedErrorBorder: widget.theme.focusedErrorBorder,
        disabledBorder: widget.theme.disabledBorder,
        border: widget.theme.border,
      ),
    );
  }

  /// Builds the label with a red asterisk if required.
  Widget? _buildLabel() {
    if (widget.labelText == null) return null;

    return RichText(
      text: TextSpan(
        text: widget.labelText,
        style:
            widget.theme.labelTextStyle ??
            Theme.of(context).textTheme.bodyLarge,
        children: <TextSpan>[
          if (widget.isRequired)
            TextSpan(
              text: ' *',
              style:
                  widget.theme.requiredAsteriskStyle ??
                  TextStyle(
                    color: Colors.red.shade700,
                    fontWeight: FontWeight.bold,
                  ),
            ),
        ],
      ),
    );
  }

  /// Builds the prefix icon with theme styling.
  Widget? _buildPrefixIcon() {
    return widget.prefixIcon != null
        ? Icon(
          widget.prefixIcon,
          color: widget.theme.prefixIconColor,
          size: widget.theme.prefixIconSize,
        )
        : null;
  }

  /// Builds the suffix icon, prioritizing password and date picker icons.
  Widget? _buildSuffixIcon() {
    // Password toggle icon
    if (widget.isPassword) {
      return IconButton(
        icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
        color: widget.theme.suffixIconColor,
        iconSize: widget.theme.suffixIconSize,
        onPressed: () => setState(() => _obscureText = !_obscureText),
      );
    }

    // Date picker icon
    if (widget.isDatePicker) {
      return IconButton(
        icon: Icon(
          widget.suffixIcon ?? Icons.calendar_today,
          color: widget.theme.suffixIconColor,
          size: widget.theme.suffixIconSize,
        ),
        onPressed: _pickDate,
      );
    }

    // Generic suffix icon
    if (widget.suffixIcon != null) {
      return Icon(
        widget.suffixIcon,
        color: widget.theme.suffixIconColor,
        size: widget.theme.suffixIconSize,
      );
    }

    return null;
  }

  /// Displays the date picker dialog and updates the controller.
  Future<void> _pickDate() async {
    FocusScope.of(context).requestFocus(FocusNode());

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: widget.startingDate ?? DateTime(1900),
      lastDate: widget.endingDate ?? DateTime(2100),
    );

    if (pickedDate != null) {
      final formattedDate =
          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      widget.controller?.text = formattedDate;
      widget.onChanged?.call(formattedDate);
    }
  }
}
