import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> items;
  final IconData icon;
  final void Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.hint,
    required this.value,
    required this.items,
    required this.icon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade200),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            icon: Icon(icon, color: Colors.blue),
            border: InputBorder.none,
          ),
          hint: Text(hint),
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
          borderRadius: BorderRadius.circular(16),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
