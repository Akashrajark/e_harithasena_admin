import 'package:e_harithasena_admin/ui/screens/sections/worker_section.dart';
import 'package:flutter/material.dart';

import '../widgets/account_button.dart';
import '../widgets/branding.dart';
import '../widgets/custom_drawer.dart';
import 'sections/dashboard_section.dart';

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
      length: 5,
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
        ],
      ),
    );
  }
}
