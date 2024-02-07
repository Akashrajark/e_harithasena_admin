import 'package:e_harithasena_admin/ui/screens/sections/dashboard_section.dart';
import 'package:e_harithasena_admin/ui/widgets/customer_section/custom_customer_datatable.dart';
import 'package:flutter/material.dart';

import '../../../values/colors.dart';
import '../../widgets/width_bound.dart';

class CustomerSection extends StatefulWidget {
  final TabController tabController;
  const CustomerSection({super.key, required this.tabController});

  @override
  State<CustomerSection> createState() => _CustomerSectionState();
}

class _CustomerSectionState extends State<CustomerSection> {
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
                  'Users',
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
            Expanded(
              child: CustomCustomersDataTable(
                text: dataList,
              ),
            )
          ],
        ),
      ),
    );
  }
}
