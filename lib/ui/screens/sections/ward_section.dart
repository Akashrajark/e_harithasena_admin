import 'package:e_harithasena_admin/ui/widgets/ward/add_edit_ward.dart';
import 'package:e_harithasena_admin/ui/widgets/ward/custom_ward_table.dart';
import 'package:flutter/material.dart';

import '../../../values/colors.dart';
import '../../widgets/custom_action_button.dart';
import '../../widgets/width_bound.dart';

class WardSection extends StatefulWidget {
  final TabController tabController;
  const WardSection({super.key, required this.tabController});

  @override
  State<WardSection> createState() => _WardSectionState();
}

class _WardSectionState extends State<WardSection> {
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
                  'Ward',
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
                        context: context, builder: (context) => AddEditWard());
                  },
                  label: "Add Worker",
                  iconData: Icons.add,
                  inverse: true,
                )
              ],
            ),
            const Expanded(
              child: CustomWardTable(),
            )
          ],
        ),
      ),
    );
  }
}
