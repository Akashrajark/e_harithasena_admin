import 'package:e_harithasena_admin/ui/widgets/dristict/add_edit_district.dart';
import 'package:e_harithasena_admin/ui/widgets/dristict/custom_district_table.dart';
import 'package:flutter/material.dart';

import '../../../values/colors.dart';
import '../../widgets/custom_action_button.dart';
import '../../widgets/width_bound.dart';

class DistrictSection extends StatefulWidget {
  final TabController tabController;
  const DistrictSection({super.key, required this.tabController});

  @override
  State<DistrictSection> createState() => _DistrictSectionState();
}

class _DistrictSectionState extends State<DistrictSection> {
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
                  'District',
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
                        builder: (context) => AddEditDistrict());
                  },
                  label: "Add Worker",
                  iconData: Icons.add,
                  inverse: true,
                )
              ],
            ),
            const Expanded(
              child: CustomDistrictTable(),
            ),
          ],
        ),
      ),
    );
  }
}
