import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class CustomCustomersDataTable extends StatelessWidget {
  const CustomCustomersDataTable({
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
          label: Text("Email"),
        ),
        DataColumn2(
          label: Text("Address"),
        ),
        DataColumn2(
          size: ColumnSize.M,
          label: Text("Point"),
        ),
        DataColumn2(
          size: ColumnSize.M,
          label: Text("Rescheduled"),
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
            DataCell(
              Text("xjfnjfjjjj"),
            ),
          ],
        ),
      ),
    );
  }
}
