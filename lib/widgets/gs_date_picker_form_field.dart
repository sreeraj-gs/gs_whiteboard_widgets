import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GsDatePickerFormField extends StatefulWidget {
  const GsDatePickerFormField({
    super.key,
    this.label,
    this.hintText,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    required this.onDateSelected,
    this.validator,
    this.dateFormat,
    this.backgroundColor,
    this.noBorder = false,
  });

  final String? label;
  final String? hintText;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<DateTime?> onDateSelected;
  final String? Function(DateTime?)? validator;
  final DateFormat? dateFormat;
  final Color? backgroundColor;
  final bool noBorder;

  @override
  State<GsDatePickerFormField> createState() => _GsDatePickerFormFieldState();
}

class _GsDatePickerFormFieldState extends State<GsDatePickerFormField> {
  late final TextEditingController _controller;
  DateTime? _selectedDate;
  late final DateFormat _effectiveDateFormat;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _selectedDate = widget.initialDate;
    _effectiveDateFormat = widget.dateFormat ?? DateFormat('dd/MM/yyyy');

    if (_selectedDate != null) {
      _controller.text = _effectiveDateFormat.format(_selectedDate!);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? widget.initialDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(2000),
      lastDate: widget.lastDate ?? DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _controller.text = _effectiveDateFormat.format(_selectedDate!);
      });
      widget.onDateSelected(_selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      onTap: () => _selectDate(context),
      validator:
          widget.validator != null
              ? (value) => widget.validator!(_selectedDate)
              : null,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText ?? 'Select date',
        suffixIcon: const Icon(Icons.calendar_month, color: Color(0xFF8B8A8D)),
        border: OutlineInputBorder(
          borderSide: widget.noBorder ? BorderSide.none : const BorderSide(),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        filled: widget.backgroundColor != null,
        fillColor: widget.backgroundColor,
      ),
    );
  }
}
