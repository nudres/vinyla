import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'di/di.dart';

Future<void> bootstrap(FutureOr<Widget> Function(GetIt diContainer) builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final diContainer = await configureDependencies();
      return runApp(await builder(diContainer));
    },
    (error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    },
  );
}
