import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWithLabel extends StatelessWidget {
  final String label, text;
  final CrossAxisAlignment alignment;
  const TextWithLabel({
    super.key,
    required this.label,
    required this.text,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        SelectableText(
          label,
          style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
          ),
        ),
        const SizedBox(height: 2.5),
        SelectableText(
          text,
          style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
          ),
        ),
      ],
    );
  }
}
