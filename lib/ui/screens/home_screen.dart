import 'package:e_harithasena_admin/ui/screens/sections/customer_section.dart';
import 'package:e_harithasena_admin/ui/screens/sections/district_section.dart';
import 'package:e_harithasena_admin/ui/screens/sections/muncipality_section.dart';
import 'package:e_harithasena_admin/ui/screens/sections/ward_section.dart';
import 'package:flutter/material.dart';

import '../widgets/account_button.dart';
import '../widgets/branding.dart';
import '../widgets/custom_drawer.dart';
import 'sections/dashboard_section.dart';
import 'sections/worker_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 6,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Branding(height: 25),
        actions: const [AccountButton()],
      ),
      drawer: CustomDrawer(
        tabController: _tabController,
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          DashboardSection(
            tabController: _tabController,
          ),
          WorkerSection(
            tabController: _tabController,
          ),
          CustomerSection(
            tabController: _tabController,
          ),
          DistrictSection(
            tabController: _tabController,
          ),
          MuncipalitySection(
            tabController: _tabController,
          ),
          WardSection(
            tabController: _tabController,
          ),
        ],
      ),
    );
  }
}
