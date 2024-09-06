import 'package:flutter/material.dart';

class ServicesSleepMusicView extends StatelessWidget {
  const ServicesSleepMusicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: TabBar(
          tabs: [],
        ),
      ),
    );
  }
}
