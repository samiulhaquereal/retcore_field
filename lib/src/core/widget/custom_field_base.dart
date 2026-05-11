import 'package:retcore_field/src/config/import.dart';

/// RetCoreField is a highly customizable and reusable text input widget.
///
/// It builds upon Flutter's `TextFormField` and provides a clean, theme-based
/// approach to styling. ALL visual styling is controlled through the [theme]
/// parameter, ensuring consistent design across your app.
class RetCoreField extends StatefulWidget {
  // --- Core Properties ---
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;

  // --- Text Content ---
  final String? labelText;
  final String? hintText;
  final String? helpText;
  final String? prefixText;
  final String? suffixText;

  // --- Behavior Flags ---
  final bool isPassword;
  final bool isDatePicker;
  final bool isRequired;
  final bool showClearButton;
  final bool showStrengthMeter;
  final RetCoreFieldType? type;

  // --- Input Configuration ---
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final bool autofocus;
  final bool readOnly;
  final bool? enabled;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool autocorrect;
  final bool enableSuggestions;

  // --- Validation and Callbacks ---
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;

  // --- Input Formatters ---
  final List<TextInputFormatter>? inputFormatters;

  // --- Theming ---
  final RetCoreFieldTheme theme;

  // --- Icons ---
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  // --- Date Picker Configuration ---
  final DateTime? initialDate;
  final DateTime? startingDate;
  final DateTime? endingDate;

  // --- Advanced Properties ---
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final EdgeInsets scrollPadding;
  final Iterable<String>? autofillHints;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;

  const RetCoreField({
    super.key,
    required this.theme,
    this.labelText,
    this.hintText,
    this.helpText,
    this.prefixText,
    this.suffixText,
    this.isPassword = false,
    this.isDatePicker = false,
    this.isRequired = false,
    this.showClearButton = false,
    this.showStrengthMeter = false,
    this.type,
    this.prefixIcon,
    this.suffixIcon,
    this.initialDate,
    this.startingDate,
    this.endingDate,
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
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
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
       assert(
         !isDatePicker || controller != null,
         'isDatePicker requires a controller to update the field text.',
       ),
       assert(maxLines == null || maxLines > 0);

  @override
  State<RetCoreField> createState() => _RetCoreFieldState();
}

class _RetCoreFieldState extends State<RetCoreField> with RetCoreFieldLogic {
  late bool _obscureText;
  late bool _hasText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _hasText = widget.controller?.text.isNotEmpty ?? false;
    widget.controller?.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    if (widget.controller != null) {
      // Rebuild if emptiness changed (for clear button)
      final bool currentlyHasText = widget.controller!.text.isNotEmpty;
      if (currentlyHasText != _hasText) {
        setState(() => _hasText = currentlyHasText);
      } else if (widget.isPassword && widget.showStrengthMeter) {
        // Always rebuild for password strength meter updates
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: widget.controller,
          initialValue: widget.initialValue,
          focusNode: widget.focusNode,
          keyboardType: getKeyboardType(widget.type, widget.keyboardType),
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          textAlign: widget.textAlign,
          autofocus: widget.autofocus,
          scrollController: widget.scrollController,
          scrollPhysics: widget.scrollPhysics,
          obscureText: _obscureText,
          readOnly: widget.readOnly || widget.isDatePicker,
          autocorrect: widget.autocorrect,
          enableSuggestions: widget.enableSuggestions,
          maxLength: widget.maxLength,
          maxLengthEnforcement: widget.maxLengthEnforcement,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          minLines: widget.minLines,
          enabled: widget.enabled,
          style: widget.theme.inputTextStyle,
          cursorColor: widget.theme.cursorColor,
          cursorWidth: widget.theme.cursorWidth,
          cursorHeight: widget.theme.cursorHeight,
          cursorRadius: widget.theme.cursorRadius,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          onTapOutside:
              widget.onTapOutside ??
              (event) => FocusManager.instance.primaryFocus?.unfocus(),
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          validator: getValidator(
            isRequired: widget.isRequired,
            labelText: widget.labelText,
            type: widget.type,
            customValidator: widget.validator,
          ),
          inputFormatters: widget.inputFormatters,
          autovalidateMode: widget.autovalidateMode,
          scrollPadding: widget.scrollPadding,
          autofillHints: widget.autofillHints,
          restorationId: widget.restorationId,
          enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
          decoration: _buildInputDecoration(),
        ),
        if (widget.isPassword &&
            widget.showStrengthMeter &&
            widget.controller != null)
          PasswordStrengthMeter(
            password: widget.controller!.text,
            theme: widget.theme,
          ),
      ],
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      isDense: widget.theme.isDense,
      contentPadding: widget.theme.contentPadding,
      filled: widget.theme.filled,
      fillColor: widget.theme.fillColor,
      label: _buildLabel(),
      labelStyle: widget.theme.labelTextStyle,
      hintText: widget.hintText,
      hintStyle: widget.theme.hintTextStyle,
      helperText: widget.helpText,
      helperStyle: widget.theme.helpTextStyle,
      prefixText: widget.prefixText,
      prefixStyle: widget.theme.prefixTextStyle,
      suffixText: widget.suffixText,
      suffixStyle: widget.theme.suffixTextStyle,
      errorStyle: widget.theme.errorTextStyle,
      errorMaxLines: widget.theme.errorMaxLines,
      prefixIcon: _buildPrefixIcon(),
      suffixIcon: _buildSuffixIcon(),
      enabledBorder: widget.theme.enabledBorder,
      focusedBorder: widget.theme.focusedBorder,
      errorBorder: widget.theme.errorBorder,
      focusedErrorBorder: widget.theme.focusedErrorBorder,
      disabledBorder: widget.theme.disabledBorder,
      border: widget.theme.border,
    );
  }

  Widget? _buildLabel() {
    if (widget.labelText == null) return null;
    return RichText(
      text: TextSpan(
        text: widget.labelText,
        style:
            widget.theme.labelTextStyle ??
            Theme.of(context).textTheme.bodyLarge,
        children: [
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

  Widget? _buildPrefixIcon() {
    return widget.prefixIcon != null
        ? Icon(
          widget.prefixIcon,
          color: widget.theme.prefixIconColor,
          size: widget.theme.prefixIconSize,
        )
        : null;
  }

  Widget? _buildSuffixIcon() {
    final List<Widget> icons = [];

    if (widget.showClearButton && _hasText && !widget.readOnly) {
      icons.add(
        IconButton(
          icon: Icon(
            widget.theme.clearIcon ?? Icons.cancel,
            color: widget.theme.clearIconColor,
            size: widget.theme.suffixIconSize,
          ),
          onPressed: () {
            widget.controller?.clear();
            widget.onChanged?.call('');
          },
        ),
      );
    }

    if (widget.isPassword) {
      icons.add(
        IconButton(
          icon: Icon(
            _obscureText
                ? (widget.theme.passwordHiddenIcon ?? Icons.visibility_off)
                : (widget.theme.passwordVisibleIcon ?? Icons.visibility),
          ),
          color: widget.theme.suffixIconColor,
          iconSize: widget.theme.suffixIconSize,
          onPressed: () => setState(() => _obscureText = !_obscureText),
        ),
      );
    }

    if (widget.isDatePicker) {
      icons.add(
        IconButton(
          icon: Icon(
            widget.suffixIcon ??
                (widget.theme.datePickerIcon ?? Icons.calendar_today),
            color: widget.theme.suffixIconColor,
            size: widget.theme.suffixIconSize,
          ),
          onPressed: _pickDate,
        ),
      );
    }

    if (icons.isEmpty && widget.suffixIcon != null) {
      return Icon(
        widget.suffixIcon,
        color: widget.theme.suffixIconColor,
        size: widget.theme.suffixIconSize,
      );
    }

    if (icons.isEmpty) return null;

    return Row(mainAxisSize: MainAxisSize.min, children: icons);
  }

  Future<void> _pickDate() async {
    FocusManager.instance.primaryFocus?.unfocus();
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
