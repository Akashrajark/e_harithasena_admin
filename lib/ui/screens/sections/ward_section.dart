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
            Expanded(
              child: CustomWardTable(
                text: wards,
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Map<String, String>> wards = [
  {
    'ward_no': 'Ward 1',
    'description':
        'Residential area with well-developed infrastructure and parks.'
  },
  {
    'ward_no': 'Ward 2',
    'description':
        'Commercial hub with shopping centers and business establishments.'
  },
  {
    'ward_no': 'Ward 3',
    'description': 'Educational district with schools, colleges, and libraries.'
  },
  {
    'ward_no': 'Ward 4',
    'description': 'Cultural center with theaters, museums, and art galleries.'
  },
  {
    'ward_no': 'Ward 5',
    'description': 'Industrial zone with factories and manufacturing units.'
  },
  {
    'ward_no': 'Ward 6',
    'description':
        'Medical district with hospitals, clinics, and health centers.'
  },
  {
    'ward_no': 'Ward 7',
    'description': 'Recreational area with sports facilities and playgrounds.'
  },
  {
    'ward_no': 'Ward 8',
    'description': 'Historical district with heritage sites and monuments.'
  },
  {
    'ward_no': 'Ward 9',
    'description':
        'Green zone with gardens, forests, and environmental projects.'
  },
  {
    'ward_no': 'Ward 10',
    'description':
        'Residential area with mixed demographics and community facilities.'
  },
];
