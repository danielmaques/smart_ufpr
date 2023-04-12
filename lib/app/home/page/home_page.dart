import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BLACK19,
      appBar: AppBar(backgroundColor: AppColors.BLACK1F),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: const [
            TileWidget(
              error: 4,
            ),
          ],
        ),
      ),
    );
  }
}
