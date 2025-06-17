import 'package:flutter/material.dart';

class GsDropdownButtonFormField<T> extends StatelessWidget {
  const GsDropdownButtonFormField({
    super.key,
    required this.items,
    this.labelExtractor,
    this.initialValue,
    required this.onChanged,
    this.validator,
    this.label,
    this.isLoading = false,
    this.backgroundColor,
    this.noBorder = false,
    this.hintText,
  });
  final List<T> items;
  final String Function(T)? labelExtractor;
  final T? initialValue;
  final void Function(T?) onChanged;
  final String? Function(T?)? validator;
  final String? label;
  final String? hintText;
  final bool isLoading;
  final Color? backgroundColor;
  final bool noBorder;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: isLoading ? CircularProgressIndicator.adaptive() : null,
      padding: EdgeInsets.zero,
      elevation: 0,
      value: initialValue,
      isDense: true,
      isExpanded: true,
      items:
          items
              .map(
                (e) => DropdownMenuItem<T>(
                  value: e,
                  child: Text(
                    labelExtractor != null ? labelExtractor!(e) : e.toString(),
                  ),
                ),
              )
              .toList(),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        label: label != null ? Text(label!) : null,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: noBorder ? BorderSide.none : BorderSide(),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        filled: backgroundColor != null,
        fillColor: backgroundColor,
      ),
    );
  }
}
