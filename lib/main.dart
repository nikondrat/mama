import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/services/knowledge/views/service_screen.dart';

void main() {
  logger.runLogging(
    () => runZonedGuarded(
      () => const AppRunner().initializeAndRun(),
      logger.logZoneError,
    ),
    const LogOptions(),
  );

}


