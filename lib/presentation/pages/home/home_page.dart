import 'package:flutter/material.dart';

import 'package:simple_food_tracker/presentation/pages/diet/diet_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const DietPage();
  }
}
