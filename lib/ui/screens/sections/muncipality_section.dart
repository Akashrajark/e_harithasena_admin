import 'package:e_harithasena_admin/ui/widgets/muncipality/add_edit_muncipality.dart';
import 'package:e_harithasena_admin/ui/widgets/muncipality/custom_mucipality_table.dart';
import 'package:flutter/material.dart';

import '../../../values/colors.dart';
import '../../widgets/custom_action_button.dart';
import '../../widgets/width_bound.dart';

class MuncipalitySection extends StatefulWidget {
  final TabController tabController;
  const MuncipalitySection({super.key, required this.tabController});

  @override
  State<MuncipalitySection> createState() => _MuncipalitySectionState();
}

class _MuncipalitySectionState extends State<MuncipalitySection> {
  bool paginated = false;

  @override
  Widget build(BuildContext context) {
    return WidthBound(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Muncipality/Punchayath',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                IconButton(
                  onPressed: () {},
                  color: iconColor,
                  icon: const Icon(
                    Icons.replay_outlined,
                  ),
                ),
                const Spacer(),
                CustomActionButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AddEditMuncipality());
                  },
                  label: "Add Worker",
                  iconData: Icons.add,
                  inverse: true,
                )
              ],
            ),
            Expanded(
              child: CustomMuncipalityTable(
                text: municipalitiesInKerala,
              ),
            )
          ],
        ),
      ),
    );
  }
}
