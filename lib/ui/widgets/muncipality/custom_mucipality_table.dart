import 'package:data_table_2/data_table_2.dart';
import 'package:e_harithasena_admin/ui/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';

class CustomMuncipalityTable extends StatelessWidget {
  final List<Map<String, dynamic>> text;
  const CustomMuncipalityTable({
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
              Text(text[index]["name"]),
            ),
            DataCell(
              Text(text[index]["description"]),
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
