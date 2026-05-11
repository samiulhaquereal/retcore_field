import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retcore_field/retcore_field.dart';

void main() {
  group('RetCoreField Tests', () {
    testWidgets('Validator works when isRequired is false', (WidgetTester tester) async {
      final controller = TextEditingController();
      bool validatorCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: Builder(
                builder: (context) {
                  return RetCoreField(
                    controller: controller,
                    isRequired: false,
                    theme: RetCoreFieldTheme.defaultTheme(),
                    validator: (value) {
                      validatorCalled = true;
                      return 'test_error';
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );

      // Trigger validation
      final form = tester.state<FormState>(find.byType(Form));
      form.validate();
      await tester.pump();

      expect(validatorCalled, isTrue);
      expect(find.text('test_error'), findsOneWidget);
    });

    testWidgets('isDatePicker requires a controller', (WidgetTester tester) async {
      expect(
        () => RetCoreField(
          isDatePicker: true,
          theme: RetCoreFieldTheme.defaultTheme(),
        ),
        throwsAssertionError,
      );
    });

    testWidgets('Password toggle changes obscureText state', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RetCoreField(
              controller: controller,
              isPassword: true,
              theme: RetCoreFieldTheme.defaultTheme(),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isTrue);

      // Tap the visibility icon
      await tester.tap(find.byType(IconButton));
      await tester.pump();

      final updatedTextField = tester.widget<TextField>(find.byType(TextField));
      expect(updatedTextField.obscureText, isFalse);
    });

    testWidgets('Custom theme icons are used', (WidgetTester tester) async {
      final customTheme = RetCoreFieldTheme.defaultTheme().copyWith(
        passwordVisibleIcon: Icons.abc,
        passwordHiddenIcon: Icons.access_alarm,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RetCoreField(
              controller: TextEditingController(),
              isPassword: true,
              theme: customTheme,
            ),
          ),
        ),
      );

      // Initially obscure, should show passwordHiddenIcon (access_alarm)
      expect(find.byIcon(Icons.access_alarm), findsOneWidget);

      // Tap to show
      await tester.tap(find.byType(IconButton));
      await tester.pump();

      // Now visible, should show passwordVisibleIcon (abc)
      expect(find.byIcon(Icons.abc), findsOneWidget);
    });
  });
}
