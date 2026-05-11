import 'package:retcore_field/src/config/import.dart';

/// A widget that displays the strength of a password based on length and complexity.
class PasswordStrengthMeter extends StatelessWidget {
  /// The current password text.
  final String password;

  /// The theme used for styling the meter.
  final RetCoreFieldTheme theme;

  const PasswordStrengthMeter({
    super.key,
    required this.password,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    if (password.isEmpty) return const SizedBox.shrink();

    // Calculate strength (0 to 1)
    double strength = _calculateStrength(password);

    final color = _getColor(strength);
    final label = _getLabel(strength);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: strength,
                  backgroundColor: Colors.grey.shade200,
                  color: color,
                  minHeight: 4,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: theme.strengthMeterTextStyle?.copyWith(color: color),
              ),
            ],
          ),
        ],
      ),
    );
  }

  double _calculateStrength(String password) {
    double strength = 0;
    if (password.length >= 6) strength += 0.3;
    if (password.contains(RegExp(r'[A-Z]'))) strength += 0.2;
    if (password.contains(RegExp(r'[0-9]'))) strength += 0.2;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength += 0.3;
    return strength;
  }

  Color _getColor(double strength) {
    if (strength <= 0.3) {
      return theme.strengthMeterColors?[0] ?? Colors.red;
    } else if (strength <= 0.7) {
      return theme.strengthMeterColors?[1] ?? Colors.orange;
    } else {
      return theme.strengthMeterColors?[2] ?? Colors.green;
    }
  }

  String _getLabel(double strength) {
    if (strength <= 0.3) return 'Weak';
    if (strength <= 0.7) return 'Medium';
    return 'Strong';
  }
}
