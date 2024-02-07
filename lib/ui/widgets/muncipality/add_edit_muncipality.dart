import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/value_validators.dart';
import '../../../values/colors.dart';
import '../custom_alert_dialog.dart';
import '../custom_select_box.dart';

class AddEditMuncipality extends StatefulWidget {
  final Map<String, dynamic>? staffTypeDetails;
  final Function(Map<String, dynamic> staffType)? onAdd;
  final Function(Map<String, dynamic> staffType, int staffTypeId)? onEdit;
  const AddEditMuncipality({
    super.key,
    this.staffTypeDetails,
    this.onAdd,
    this.onEdit,
  });

  @override
  State<AddEditMuncipality> createState() => _AddEditMuncipalityState();
}

class _AddEditMuncipalityState extends State<AddEditMuncipality> {
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
      title: widget.staffTypeDetails != null
          ? 'EDIT MUNCIPALITY TYPE'
          : 'ADD MUNCIPALITY TYPE',
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
                'NAME',
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
                'MUNCIPALITY/PANCHAYATH',
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
                  hintText: 'Enter muncipality/panchayathu',
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

List<Map<String, String>> municipalitiesInKerala = [
  {
    'name': 'Thiruvananthapuram',
    'description':
        'The capital city of Kerala, known for its rich cultural heritage and historical landmarks.'
  },
  {
    'name': 'Kochi',
    'description':
        'A major port city known for its backwaters, spice markets, and colonial architecture.'
  },
  {
    'name': 'Kozhikode',
    'description':
        'Historically significant city known for its beaches, museums, and ancient temples.'
  },
  {
    'name': 'Kollam',
    'description':
        'Famous for its Ashtamudi Lake, cashew processing industry, and historic temples.'
  },
  {
    'name': 'Thrissur',
    'description':
        'Cultural capital of Kerala, known for its vibrant festivals, art, and traditional architecture.'
  },
  {
    'name': 'Alappuzha',
    'description':
        'Renowned for its picturesque backwaters, houseboat cruises, and annual Nehru Trophy Boat Race.'
  },
  {
    'name': 'Kannur',
    'description':
        'Known for its pristine beaches, handloom industry, and historical monuments.'
  },
  {
    'name': 'Palakkad',
    'description':
        'Nicknamed as the "Granary of Kerala", famous for its fertile land, dams, and wildlife sanctuaries.'
  },
  {
    'name': 'Malappuram',
    'description':
        'Known for its rich cultural diversity, mosques, and historical significance.'
  },
  {
    'name': 'Pathanamthitta',
    'description':
        'Famous for its religious sites, especially the Sabarimala Temple, and scenic beauty.'
  },
];
