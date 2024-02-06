import 'package:e_harithasena_admin/ui/widgets/custom_action_button.dart';
import 'package:e_harithasena_admin/ui/widgets/custom_select_box.dart';
import 'package:e_harithasena_admin/ui/widgets/width_bound.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/value_validators.dart';
import '../../../values/colors.dart';

class AddEditDelet extends StatelessWidget {
  const AddEditDelet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WidthBound(
        width: 850,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WidthBound(
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'EMAIL',
                        style: GoogleFonts.montserrat(
                          textStyle:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: mutedTextColor,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: alphanumericWithSpecialCharsValidator,
                        decoration: const InputDecoration(
                          hintText: 'Enter Email',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'PASSWORD',
                        style: GoogleFonts.montserrat(
                          textStyle:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: mutedTextColor,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: alphanumericWithSpecialCharsValidator,
                        decoration: const InputDecoration(
                          hintText: 'Enter password',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Name',
                        style: GoogleFonts.montserrat(
                          textStyle:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: mutedTextColor,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: alphanumericWithSpecialCharsValidator,
                        decoration: const InputDecoration(
                          hintText: 'Enter Name',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Phone',
                        style: GoogleFonts.montserrat(
                          textStyle:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: mutedTextColor,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: alphanumericWithSpecialCharsValidator,
                        decoration: const InputDecoration(
                          hintText: 'Enter Phone',
                        ),
                      ),
                    ],
                  ),
                ),
                WidthBound(
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'District',
                        style: GoogleFonts.montserrat(
                          textStyle:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: mutedTextColor,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomSelectBox(
                        items: [CustomSelectBoxItem(label: "a", value: 1)],
                        label: "District",
                        onChange: (selecteditem) {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'MUNCIPALITY/PANCHAYATH',
                        style: GoogleFonts.montserrat(
                          textStyle:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: mutedTextColor,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomSelectBox(
                        items: [CustomSelectBoxItem(label: "a", value: 1)],
                        label: "Munciplaity/Panchayath",
                        onChange: (selecteditem) {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'WARD NO',
                        style: GoogleFonts.montserrat(
                          textStyle:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: mutedTextColor,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomSelectBox(
                        items: [CustomSelectBoxItem(label: "a", value: 1)],
                        label: "Ward No",
                        onChange: (selecteditem) {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'HOUSE NO',
                        style: GoogleFonts.montserrat(
                          textStyle:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: mutedTextColor,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: alphanumericWithSpecialCharsValidator,
                        decoration: const InputDecoration(
                          hintText: 'Enter house no',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomActionButton(
              onPressed: () {},
              label: "Save",
              inverse: true,
            )
          ],
        ),
      ),
    );
  }
}
