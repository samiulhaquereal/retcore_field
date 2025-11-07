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
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      home: RegistrationForm(),
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
                validator:
                    (value) =>
                        (value?.isEmpty ?? true) ? 'Email is required' : null,
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
                validator:
                    (value) =>
                        (value?.length ?? 0) < 6
                            ? 'Password must be at least 6 characters'
                            : null,
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
