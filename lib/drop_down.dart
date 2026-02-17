import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String hintText;
  final List<T> items;
  final T? value;
  final void Function(T?) onChanged;
  final String Function(T) itemLabel;
  final String? Function(T?)? validator;
  final double borderRadius;
  final Color? fillColor;

  const CustomDropdown({
    Key? key,
    required this.hintText,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.itemLabel,
    this.validator,
    this.borderRadius = 14,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: fillColor ?? Colors.grey.shade100,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Colors.deepPurple,
            width: 1.5,
          ),
        ),
      ),
      items: items
          .map(
            (item) => DropdownMenuItem<T>(
          value: item,
          child: Text(itemLabel(item)),
        ),
      )
          .toList(),
    );
  }
}