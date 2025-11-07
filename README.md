# RetCoreField

<p align="center">
  A highly customizable and feature-rich TextField widget for Flutter with built-in support for password fields, date pickers, validation, and theming. Simplifies form creation with a clean, theme-based API that separates styling from functionality.
</p>

<p align="center">
  <!-- Pub.dev Badge -->
  <a href="https://pub.dev/packages/retcore_field"><img src="https://img.shields.io/pub/v/retcore_field.svg" alt="Pub.dev"></a>
  <!-- License Badge -->
  <a href="https://github.com/samiulhaquereal/retcore_field/blob/master/LICENSE"><img src="https://img.shields.io/github/license/samiulhaquereal/retcore_field" alt="License"></a>
  <!-- Popularity Badge -->
  <a href="https://pub.dev/packages/retcore_field"><img src="https://img.shields.io/pub/popularity/retcore_field" alt="Popularity"></a>
</p>

---


## Key Features

✨ **Rich Feature Set**
- 🔐 **Password Fields** - Built-in visibility toggle with eye icon
- 📅 **Date Picker** - Integrated calendar picker with formatted date output
- ✅ **Conditional Validation** - Enable/disable validation with `isRequired` flag
- 🎨 **Theme-Based Styling** - Separate colors and sizes for clean architecture
- 🎯 **Prefix & Suffix Icons** - Easy icon integration
- 📝 **Required Field Indicator** - Automatic asterisk (*) for required fields
- ♿ **Accessible** - Proper focus management and keyboard handling

🏗️ **Clean Architecture**
- Separation of styling (theme) from functionality (widget)
- Global color and size management via static classes
- Easy customization through `copyWith` method
- Production-ready with comprehensive validation support

## Installation

Add this to your package's `pubspec.yaml` file:

dependencies:
    retcore_field:


## Customization

### Theme Structure

RetCoreField uses three main components for theming:

1. **RetCoreFieldTheme** - Main theme class that combines colors and sizes

### Available Theme Properties

#### Text Styles
- `inputTextStyle` - Style for input text
- `hintTextStyle` - Style for hint text
- `labelTextStyle` - Style for label text
- `errorTextStyle` - Style for error messages
- `requiredAsteriskStyle` - Style for the required asterisk (*)

#### Icon Properties
- `prefixIconColor` - Color for prefix icons
- `prefixIconSize` - Size for prefix icons
- `suffixIconColor` - Color for suffix icons
- `suffixIconSize` - Size for suffix icons

#### Border Properties
- `borderColor` - Color for enabled border
- `focusedBorderColor` - Color for focused border
- `errorBorderColor` - Color for error border
- `borderRadius` - Corner radius for borders
- Custom borders: `enabledBorder`, `focusedBorder`, `errorBorder`, `focusedErrorBorder`, `disabledBorder`

#### Background
- `filled` - Whether to fill the field
- `fillColor` - Background fill color

#### Cursor
- `cursorColor` - Cursor color
- `cursorWidth` - Cursor width
- `cursorHeight` - Cursor height
- `cursorRadius` - Cursor corner radius

#### Layout
- `isDense` - Use dense layout
- `contentPadding` - Internal padding
- `errorMaxLines` - Max lines for error text

## Widget Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `controller` | `TextEditingController?` | Controls the text being edited | `null` |
| `labelText` | `String?` | Label text above the field | `null` |
| `hintText` | `String?` | Hint text when field is empty | `null` |
| `isPassword` | `bool` | Enable password mode with toggle | `false` |
| `isDatePicker` | `bool` | Enable date picker mode | `false` |
| `isRequired` | `bool` | Enable validation (shows asterisk) | `false` |
| `prefixIcon` | `IconData?` | Icon before input text | `null` |
| `suffixIcon` | `IconData?` | Icon after input text | `null` |
| `validator` | `FormFieldValidator<String>?` | Validation function | `null` |
| `onChanged` | `ValueChanged<String>?` | Callback on text change | `null` |
| `keyboardType` | `TextInputType?` | Keyboard type | `null` |
| `maxLength` | `int?` | Maximum character length | `null` |
| `maxLines` | `int?` | Maximum number of lines | `1` |
| `enabled` | `bool?` | Whether field is enabled | `true` |
| `readOnly` | `bool` | Whether field is read-only | `false` |
| `theme` | `RetCoreFieldTheme` | Visual theme (required) | - |


## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Issues

If you encounter any issues or have feature requests, please file them in the [issue tracker](https://github.com/samiulhaquereal/retcore_field/issues).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

**Samiul Haque**
- GitHub: [@samiulhaquereal](https://github.com/samiulhaquereal)

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a list of changes.

---

Made with ❤️ for the Flutter community

