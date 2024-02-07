import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_harithasena_admin/bloc/district/district_bloc.dart';
import 'package:e_harithasena_admin/ui/widgets/dristict/add_edit_district.dart';
import 'package:e_harithasena_admin/ui/widgets/dristict/custom_district_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../values/colors.dart';
import '../../widgets/custom_action_button.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/width_bound.dart';

class DistrictSection extends StatefulWidget {
  final TabController tabController;
  const DistrictSection({super.key, required this.tabController});

  @override
  State<DistrictSection> createState() => _DistrictSectionState();
}

class _DistrictSectionState extends State<DistrictSection> {
  bool paginated = false;
  DistrictBloc districtBloc = DistrictBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WidthBound(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: BlocProvider.value(
          value: districtBloc,
          child: BlocConsumer<DistrictBloc, DistrictState>(
            listener: (context, state) {
              if (state is DistrictFailureState) {
                showDialog(
                  context: context,
                  builder: (context) => CustomAlertDialog(
                    title: 'Failure',
                    description: state.message,
                    primaryButton: 'OK',
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'District',
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
                          showDialog(
                              context: context,
                              builder: (context) => AddEditDistrict(
                                    onAdd: (district) {
                                      districtBloc.add(
                                          DistrictEvent(district: district));
                                    },
                                  ));
                        },
                        label: "Add Worker",
                        iconData: Icons.add,
                        inverse: true,
                      )
                    ],
                  ),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("districts")
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else if (snapshot.data!.docs.isEmpty) {
                        return Text("No Data");
                      } else {
                        // Extract district names from QuerySnapshot
                        List<Map<String, dynamic>> districtNames =
                            snapshot.data!.docs.map((doc) {
                          return {
                            'name': doc[
                                'name'], // assuming 'name' is the field containing district name
                            // Add other fields if needed
                          };
                        }).toList();

                        return Expanded(
                          child: CustomDistrictTable(
                            text: districtNames,
                          ),
                        );
                      }
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
