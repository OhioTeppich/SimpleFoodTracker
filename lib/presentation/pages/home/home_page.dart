import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 30,
          width: 30,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
