import 'package:flutter/material.dart';
import 'package:retcore_field/retcore_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RetCore Field Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _priceController = TextEditingController();
  final _urlController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _priceController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Custom theme for testing icons
    final customTheme = RetCoreFieldTheme.defaultTheme().copyWith(
      passwordVisibleIcon: Icons.visibility_rounded,
      passwordHiddenIcon: Icons.visibility_off_rounded,
      datePickerIcon: Icons.event_available,
      clearIcon: Icons.highlight_off_rounded,
      clearIconColor: Colors.red.shade300,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('RetCore Field Pro Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Premium Form Features',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // 1. Email with Clear Button & Preset Validation
              RetCoreField(
                controller: _emailController,
                type: RetCoreFieldType.email,
                labelText: 'Email Address',
                hintText: 'Type to see the clear button',
                prefixIcon: Icons.email_outlined,
                isRequired: true,
                showClearButton: true,
                theme: customTheme,
              ),
              const SizedBox(height: 20),

              // 2. Phone with Prefix Text
              RetCoreField(
                controller: _phoneController,
                type: RetCoreFieldType.phone,
                labelText: 'Phone Number',
                prefixText: '+880 ',
                prefixIcon: Icons.phone_android,
                isRequired: true,
                theme: RetCoreFieldTheme.defaultTheme(),
              ),
              const SizedBox(height: 20),

              // 3. Price with Prefix Text & Number Preset
              RetCoreField(
                controller: _priceController,
                type: RetCoreFieldType.number,
                labelText: 'Product Price',
                prefixText: '\$ ',
                hintText: '0.00',
                suffixText: ' USD',
                isRequired: true,
                theme: RetCoreFieldTheme.defaultTheme(),
              ),
              const SizedBox(height: 20),

              // 4. URL with Suffix Text
              RetCoreField(
                controller: _urlController,
                type: RetCoreFieldType.url,
                labelText: 'Personal Website',
                suffixText: '.com',
                prefixIcon: Icons.language,
                showClearButton: true,
                theme: RetCoreFieldTheme.defaultTheme(),
              ),
              const SizedBox(height: 20),

              // 5. Password with Strength Meter
              RetCoreField(
                controller: _passwordController,
                isPassword: true,
                showStrengthMeter: true,
                labelText: 'Secure Password',
                hintText: 'Try Uppercase + Numbers + Symbols',
                prefixIcon: Icons.lock_outline,
                isRequired: true,
                theme: RetCoreFieldTheme.defaultTheme(),
              ),
              const SizedBox(height: 32),

              // Submit Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Form is valid! 🎉'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                child: const Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
