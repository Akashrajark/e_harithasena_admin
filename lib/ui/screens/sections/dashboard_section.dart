import 'package:e_harithasena_admin/ui/widgets/customer_section/custom_customer_datatable.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
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
                  label: 'WORKERS',
                  value: '10',
                  iconData: Icons.shopping_cart_outlined,
                  onPressed: () {
                    widget.tabController.animateTo(1);
                  },
                ),
                DashboardItem(
                  label: 'USERS',
                  value: '10',
                  iconData: Icons.shopping_cart_outlined,
                  onPressed: () {
                    widget.tabController.animateTo(2);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: CustomCustomersDataTable(
                text: dataList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, String>> dataList = [
  {
    'name': 'John Doe',
    'email': 'john@example.com',
    'address': '123 Main St',
    'point': '100',
    'reschedule': 'Yes'
  },
  {
    'name': 'Alice Smith',
    'email': 'alice@example.com',
    'address': '456 Elm St',
    'point': '75',
    'reschedule': 'No'
  },
  {
    'name': 'Bob Johnson',
    'email': 'bob@example.com',
    'address': '789 Oak St',
    'point': '50',
    'reschedule': 'Yes'
  },
  {
    'name': 'Emily Brown',
    'email': 'emily@example.com',
    'address': '101 Pine St',
    'point': '90',
    'reschedule': 'No'
  },
  {
    'name': 'Michael Wilson',
    'email': 'michael@example.com',
    'address': '202 Cedar St',
    'point': '80',
    'reschedule': 'Yes'
  },
  {
    'name': 'Sophia Davis',
    'email': 'sophia@example.com',
    'address': '303 Walnut St',
    'point': '70',
    'reschedule': 'No'
  },
  {
    'name': 'James Miller',
    'email': 'james@example.com',
    'address': '404 Maple St',
    'point': '60',
    'reschedule': 'Yes'
  },
  {
    'name': 'Olivia Wilson',
    'email': 'olivia@example.com',
    'address': '505 Birch St',
    'point': '95',
    'reschedule': 'No'
  },
  {
    'name': 'William Taylor',
    'email': 'william@example.com',
    'address': '606 Pineapple St',
    'point': '85',
    'reschedule': 'Yes'
  },
  {
    'name': 'Emma Anderson',
    'email': 'emma@example.com',
    'address': '707 Banana St',
    'point': '55',
    'reschedule': 'No'
  },
];
