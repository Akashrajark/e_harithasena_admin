import 'package:flutter/material.dart';

import '../../../values/colors.dart';
import '../../widgets/dashboard/dashboard_item.dart';
import '../../widgets/width_bound.dart';

class DashboardSection extends StatefulWidget {
  final TabController tabController;
  const DashboardSection({super.key, required this.tabController});

  @override
  State<DashboardSection> createState() => _DashboardSectionState();
}

class _DashboardSectionState extends State<DashboardSection> {
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
                'Dashboard',
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
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            children: [
              DashboardItem(
                label: 'SALSES TODAY',
                value: '10',
                iconData: Icons.shopping_cart_outlined,
                onPressed: () {
                  widget.tabController.animateTo(1);
                },
              ),
              DashboardItem(
                label: 'SALSES TODAY',
                value: '10',
                iconData: Icons.shopping_cart_outlined,
                onPressed: () {
                  widget.tabController.animateTo(1);
                },
              ),
              DashboardItem(
                label: 'SALSES TODAY',
                value: '10',
                iconData: Icons.shopping_cart_outlined,
                onPressed: () {
                  widget.tabController.animateTo(1);
                },
              ),
              DashboardItem(
                label: 'SALSES TODAY',
                value: '10',
                iconData: Icons.shopping_cart_outlined,
                onPressed: () {
                  widget.tabController.animateTo(1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
