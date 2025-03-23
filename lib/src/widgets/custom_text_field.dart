import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final bool isRequired;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.blue.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.blue.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.blue.shade800, width: 2),
        ),
        filled: true,
        fillColor: Colors.blue.shade50,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      keyboardType: keyboardType,
      validator: isRequired
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $label';
              }
              return null;
            }
          : null,
    );
  }
}
