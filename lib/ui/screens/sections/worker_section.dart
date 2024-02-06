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
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50),
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
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
