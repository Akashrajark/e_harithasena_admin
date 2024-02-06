import 'package:data_table_2/data_table_2.dart';
import 'package:e_harithasena_admin/ui/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';

class CustomWorkersDataTable extends StatelessWidget {
  const CustomWorkersDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columns: const [
        DataColumn2(
          label: Text("Name"),
        ),
        DataColumn2(
          label: Text("Address"),
        ),
        DataColumn2(
          label: Text("Phone"),
        ),
        DataColumn2(
          label: Text("Email"),
        ),
        DataColumn2(
          size: ColumnSize.M,
          label: Text(""),
        ),
      ],
      rows: List.generate(
        10,
        (index) => DataRow(
          cells: [
            DataCell(
              Text("xjfnj"),
            ),
            DataCell(
              Text("xjfnj"),
            ),
            DataCell(
              Text("xjfnj"),
            ),
            DataCell(
              Text("xjfnjfjjjj"),
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
