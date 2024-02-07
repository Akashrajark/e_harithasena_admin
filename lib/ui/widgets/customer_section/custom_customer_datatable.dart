import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class CustomCustomersDataTable extends StatelessWidget {
  final List<Map<String, dynamic>> text;
  const CustomCustomersDataTable({
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
        text.length,
        (index) => DataRow(
          cells: [
            DataCell(
              Text(text[index]["name"]),
            ),
            DataCell(
              Text(text[index]["email"]),
            ),
            DataCell(
              Text(text[index]["address"]),
            ),
            DataCell(
              Text(text[index]["point"]),
            ),
            DataCell(
              Text(text[index]["reschedule"]),
            ),
          ],
        ),
      ),
    );
  }
}
