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
              child: CustomWorkersDataTable(
                text: indianCitizens,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, String>> indianCitizens = [
  {
    'name': 'Rajesh Kumar',
    'email': 'rajesh.kumar@example.com',
    'phone': '+919876543210',
    'address': '123, Main Street, Connaught Place',
  },
  {
    'name': 'Priya Sharma',
    'email': 'priya.sharma@example.com',
    'phone': '+918765432109',
    'address': '456, South Avenue, Bandra',
  },
  {
    'name': 'Amit Patel',
    'email': 'amit.patel@example.com',
    'phone': '+917654321098',
    'address': '789, Gandhi Road, Maninagar',
  },
  {
    'name': 'Sneha Reddy',
    'email': 'sneha.reddy@example.com',
    'phone': '+919876543210',
    'address': '321, Hill View Apartments, Hi-Tech City',
  },
  {
    'name': 'Vikram Singh',
    'email': 'vikram.singh@example.com',
    'phone': '+918765432109',
    'address': '567, Teachers Colony, Malviya Nagar',
  },
  {
    'name': 'Neha Gupta',
    'email': 'neha.gupta@example.com',
    'phone': '+917654321098',
    'address': '890, Park Avenue, Koregaon Park',
  },
  {
    'name': 'Sanjay Mishra',
    'email': 'sanjay.mishra@example.com',
    'phone': '+919876543210',
    'address': '234, Lake Road, Salt Lake City',
  },
  {
    'name': 'Anjali Joshi',
    'email': 'anjali.joshi@example.com',
    'phone': '+918765432109',
    'address': '678, Fashion Street, Mylapore',
  },
  {
    'name': 'Rajesh Singhania',
    'email': 'rajesh.singhania@example.com',
    'phone': '+917654321098',
    'address': '345, Startup Avenue, Koramangala',
  },
  {
    'name': 'Nisha Sharma',
    'email': 'nisha.sharma@example.com',
    'phone': '+919876543210',
    'address': '901, Press Enclave, Hazratganj',
  },
];
