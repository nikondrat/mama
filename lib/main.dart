import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/services/knowledge/views/service_screen.dart';

void main() {
  // logger.runLogging(
  //   () => runZonedGuarded(
  //     () => const AppRunner().initializeAndRun(),
  //     logger.logZoneError,
  //   ),
  //   const LogOptions(),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ServiceKnowledgeScreen(),
    );
  }
}
