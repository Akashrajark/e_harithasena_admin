import 'package:data_table_2/data_table_2.dart';
import 'package:e_harithasena_admin/bloc/district/district_bloc.dart';
import 'package:e_harithasena_admin/ui/widgets/custom_action_button.dart';
import 'package:e_harithasena_admin/ui/widgets/dristict/add_edit_district.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../custom_alert_dialog.dart';

class CustomDistrictTable extends StatelessWidget {
  final List<Map<String, dynamic>> text;
  const CustomDistrictTable({
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
            DataCell(Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomActionButton(
                  label: "Edit",
                  iconData: Icons.edit,
                  color: Colors.orange,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AddEditDistrict(
                        onEdit: (staffType, staffTypeId) {
                          BlocProvider.of<DistrictBloc>(context).add(
                            DistrictEditEvent(
                              name: staffType["name"],
                              id: text[index]["name"],
                            ),
                          );
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomActionButton(
                  iconData: Icons.delete,
                  color: Colors.red,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => CustomAlertDialog(
                              title: 'DELETE STAFF TYPE?',
                              description:
                                  'Are you sure you want to delete this staff type?',
                              primaryButton: 'DELETE',
                              onPrimaryPressed: () {
                                BlocProvider.of<DistrictBloc>(context).add(
                                    DistrictDeleteEvent(
                                        id: text[index]["name"]));
                                Navigator.pop(context);
                              },
                              secondaryButton: 'NO',
                            ));
                  },
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
