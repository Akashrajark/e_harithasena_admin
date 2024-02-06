import 'package:e_harithasena_admin/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'ui/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kokkadan ERP Admin',
      theme: appTheme,
      home: const HomeScreen(),
    );
  }
}
