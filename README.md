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


#### Quick Start
<p>Import the package and use the RetCoreField widget with its default theme.</p>

```
import 'package:flutter/material.dart';
import 'package:retcore_field/retcore_field.dart';

class MyForm extends StatelessWidget {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RetCoreField(
      controller: _emailController,
      labelText: 'Email',
      hintText: 'Enter your email',
      prefixIcon: Icons.email_outlined,
      theme: RetCoreFieldTheme.defaultTheme(),
    );
  }
}

```
<p>Examples</p>

#### 1. Email Field with Validation

```
RetCoreField(
  controller: _emailController,
  labelText: 'Email',
  hintText: 'your.email@example.com',
  prefixIcon: Icons.email_outlined,
  keyboardType: TextInputType.emailAddress,
  isRequired: true, // Enables validation and shows '*'
  theme: RetCoreFieldTheme.defaultTheme(),
  validator: (value) {
    if (value == null || !value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  },
)

```

#### 2. Password Field with Visibility Toggle

```
RetCoreField(
  controller: _passwordController,
  isPassword: true, // Enables password mode
  labelText: 'Password',
  hintText: 'Enter your password',
  prefixIcon: Icons.lock_outline,
  isRequired: true,
  theme: RetCoreFieldTheme.defaultTheme(),
  validator: (value) {
    if (value == null || value.length &amp;amp;amp;amp;lt; 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  },
)

```

#### 3. Date Picker Field

```
RetCoreField(
  controller: _dobController,
  isDatePicker: true, // Enables date picker
  labelText: 'Date of Birth',
  hintText: 'Select your birth date',
  readOnly: true, // Important: Prevents keyboard from appearing
  prefixIcon: Icons.calendar_month_outlined,
  theme: RetCoreFieldTheme.defaultTheme(),
  initialDate: DateTime(2000, 1, 1),
  startingDate: DateTime(1950),
  endingDate: DateTime.now(),
)

```

#### 4. Multi-line Text Area

```
RetCoreField(
  controller: _bioController,
  labelText: 'Bio',
  hintText: 'Tell us about yourself',
  maxLines: 5,
  maxLength: 500,
  theme: RetCoreFieldTheme.defaultTheme(),
)

```



### Complete Form Example

```
import 'package:flutter/material.dart';
import 'package:retcore_field/retcore_field.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() =&amp;amp;gt; _RegistrationFormState();
}

class _RegistrationFormState extends State&amp;lt;registrationform&amp;gt; {
  final _formKey = GlobalKey&amp;lt;formstate&amp;gt;();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              // Email Field
              RetCoreField(
                controller: _emailController,
                labelText: 'Email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                isRequired: true,
                theme: RetCoreFieldTheme.defaultTheme(),
                validator: (value) =&amp;amp;gt; (value?.isEmpty ?? true) ? 'Email is required' : null,
              ),
              SizedBox(height: 20),

              // Password Field
              RetCoreField(
                controller: _passwordController,
                isPassword: true,
                labelText: 'Password',
                prefixIcon: Icons.lock_outline,
                isRequired: true,
                theme: RetCoreFieldTheme.defaultTheme(),
                validator: (value) =&amp;amp;gt; (value?.length ?? 0) &amp;amp;lt; 6 ? 'Password must be at least 6 characters' : null,
              ),
              SizedBox(height: 20),

              // Date of Birth
              RetCoreField(
                controller: _dobController,
                isDatePicker: true,
                labelText: 'Date of Birth',
                readOnly: true,
                prefixIcon: Icons.calendar_month_outlined,
                theme: RetCoreFieldTheme.defaultTheme(),
              ),
              SizedBox(height: 30),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data...')),
                    );
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
&amp;lt;/formstate&amp;gt;&amp;lt;/registrationform&amp;gt;

```

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

