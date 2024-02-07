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

  void getDistrict() {
    districtBloc.add(DistrictGetEvent());
  }

  @override
  void initState() {
    getDistrict();
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
              } else if (state is DistrictSuccessState) {
                getDistrict();
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
                  Expanded(
                    child: CustomDistrictTable(
                      text: state,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
