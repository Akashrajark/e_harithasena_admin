import 'package:e_harithasena_admin/ui/widgets/custom_action_button.dart';
import 'package:e_harithasena_admin/ui/widgets/worker_section/add_edit_delete.dart';
import 'package:e_harithasena_admin/ui/widgets/worker_section/custom_worker_datatable.dart';
import 'package:flutter/material.dart';

import '../../../values/colors.dart';
import '../../widgets/width_bound.dart';

class WorkerSection extends StatefulWidget {
  final TabController tabController;
  const WorkerSection({super.key, required this.tabController});

  @override
  State<WorkerSection> createState() => _WorkerSectionState();
}

class _WorkerSectionState extends State<WorkerSection> {
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
                  'Workers',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddEditDelet(),
                      ),
                    );
                  },
                  label: "Add Worker",
                  iconData: Icons.add,
                  inverse: true,
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: CustomWorkersDataTable(),
            )
          ],
        ),
      ),
    );
  }
}
