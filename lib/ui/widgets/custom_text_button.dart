import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../values/colors.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      focusColor: textButtonColor.withOpacity(.05),
      hoverColor: textButtonColor.withOpacity(.05),
      splashColor: textButtonColor.withOpacity(.1),
      highlightColor: textButtonColor.withOpacity(.05),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Text(
          label,
          style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: textButtonColor,
                ),
          ),
        ),
      ),
    );
  }
}
