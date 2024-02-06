import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final String label;
  final bool filled;
  final Function(DateTime?) onPick;
  final DateTime? selectedDate;

  const CustomDatePicker({
    super.key,
    this.label = 'Select Date',
    this.filled = false,
    required this.onPick,
    this.selectedDate,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;

  @override
  void initState() {
    _selectedDate = widget.selectedDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: () async {
        DateTime? tempDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
        );

        if (tempDate != null) {
          _selectedDate = tempDate;
          widget.onPick(_selectedDate);
          setState(() {});
        }
      },
      decoration: InputDecoration(
        hintText: _selectedDate != null
            ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
            : widget.label,
        filled: widget.filled,
        suffixIcon: _selectedDate != null
            ? IconButton(
                onPressed: () {
                  _selectedDate = null;
                  widget.onPick(null);
                  setState(() {});
                },
                icon: const Icon(
                  Icons.clear,
                ),
              )
            : const Icon(
                Icons.date_range_outlined,
              ),
      ),
    );
  }
}
