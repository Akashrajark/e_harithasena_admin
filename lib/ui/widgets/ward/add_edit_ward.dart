import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/value_validators.dart';
import '../../../values/colors.dart';
import '../custom_alert_dialog.dart';
import '../custom_select_box.dart';

class AddEditWard extends StatefulWidget {
  final Map<String, dynamic>? staffTypeDetails;
  final Function(Map<String, dynamic> staffType)? onAdd;
  final Function(Map<String, dynamic> staffType, int staffTypeId)? onEdit;
  const AddEditWard({
    super.key,
    this.staffTypeDetails,
    this.onAdd,
    this.onEdit,
  });

  @override
  State<AddEditWard> createState() => _AddEditWardState();
}

class _AddEditWardState extends State<AddEditWard> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.staffTypeDetails != null) {
      _nameController.text = widget.staffTypeDetails!['name'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title:
          widget.staffTypeDetails != null ? 'EDIT WARD TYPE' : 'ADD WARD TYPE',
      content: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 15,
        ),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DISTRICT',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              CustomSelectBox(
                  items: [], label: "test", onChange: (onChange) {}),
              const SizedBox(height: 10),
              Text(
                'MUNCIPALITY/PUNCHAYATH',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              CustomSelectBox(
                  items: [], label: "test", onChange: (onChange) {}),
              const SizedBox(height: 10),
              Text(
                'WARD',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _nameController,
                validator: alphanumericWithSpecialCharsValidator,
                decoration: const InputDecoration(
                  hintText: 'Enter ward',
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      primaryButton: 'SAVE',
      onPrimaryPressed: () {
        if (formKey.currentState!.validate()) {
          if (widget.staffTypeDetails != null) {
            //edit
            widget.onEdit!({
              'name': _nameController.text.trim(),
            }, widget.staffTypeDetails!['id']);
            Navigator.pop(context);
          } else {
            //add
            widget.onAdd!({
              'name': _nameController.text.trim(),
            });
            Navigator.pop(context);
          }
        }
      },
    );
  }
}
