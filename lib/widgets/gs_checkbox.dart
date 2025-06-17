import 'package:flutter/material.dart';
import 'package:gs_whiteboard_widgets/utils/sizer.dart';

class GsCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;

  const GsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox.adaptive(value: value, onChanged: onChanged),
        Text(label, style: context.textTheme.labelLarge),
      ],
    );
  }
}
