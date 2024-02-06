import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../values/colors.dart';

class CustomRadioButton extends StatelessWidget {
  final String label;
  final bool isChecked;
  final Function() onPressed;
  const CustomRadioButton({
    super.key,
    required this.label,
    this.isChecked = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              isChecked ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isChecked ? iconColor : Colors.grey,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: isChecked ? iconColor : Colors.black87,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
