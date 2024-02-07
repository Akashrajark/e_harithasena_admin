import 'package:data_table_2/data_table_2.dart';
import 'package:e_harithasena_admin/ui/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';

class CustomWardTable extends StatelessWidget {
  final List<Map<String, String>> text;
  const CustomWardTable({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columns: const [
        DataColumn2(
          label: Text("Name"),
        ),
        DataColumn2(
          label: Text("Description"),
        ),
        DataColumn2(
          label: Text(""),
        ),
      ],
      rows: List.generate(
        text.length,
        (index) => DataRow(
          cells: [
            DataCell(
              Text(text[index]["ward_no"]!),
            ),
            DataCell(
              Text(text[index]["description"]!),
            ),
            DataCell(Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomActionButton(
                  label: "Edit",
                  iconData: Icons.edit,
                  color: Colors.orange,
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomActionButton(
                  iconData: Icons.delete,
                  color: Colors.red,
                  onPressed: () {},
                ),
              ],
            ))
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
