import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Branding extends StatelessWidget {
  final double height;
  const Branding({
    super.key,
    this.height = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "E_HARITHASENA",
      style: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.headlineSmall),
    ));
  }
}
